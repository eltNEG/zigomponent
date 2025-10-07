const std = @import("std");
const assert = @import("std").debug.assert;
const renderErr = @import("../errors/render.zig").RenderError;

pub fn Writer(comptime T: type, comptime initial: []const T, comptime new: []const T) type {
    return struct {
        const store: []const T = initial ++ new;

        fn Write(comptime value: []const T) type {
            return Writer(T, store, value);
        }

        fn write(comptime value: []const T) type {
            return Writer(T, store, value);
        }

        pub fn Value() []const T {
            return store;
        }
    };
}

test "writer" {
    const writer = Writer(u8, "Hello", "World");
    std.testing.expectEqualStrings(writer.Value(), "HelloWorld");
}

pub const NodeType = enum { element, text, childless, attribute, nodes };

pub const Node = struct {
    node_type: NodeType,
    data: NodeData,

    const NodeData = union(NodeType) { element: ElementData, text: TextData, childless: ChildessElementData, attribute: AtrributeData, nodes: NodesData };

    const ElementData = struct {
        name: []const u8,
        children: ?[]const Node,
    };

    const NodesData = struct {
        children: ?[]const Node,
    };

    const TextData = struct {
        content: []const u8,
    };

    const ChildessElementData = struct {
        name: []const u8,
        children: ?[]const Node,
    };

    const AtrributeData = struct {
        name: []const u8,
        value: ?[]const u8,
    };

    pub fn render2(self: *const Node, _mem: type) type {
        switch (self.data) {
            .element => |elem| {
                var mem = _mem.write("<");
                mem = mem.write(elem.name);
                if (elem.children) |children| {
                    for (children) |*child| {
                        if (child.node_type == .attribute) {
                            mem = child.render2(mem);
                        }
                    }
                }
                mem = mem.write(">");
                if (elem.children) |children| {
                    for (children) |*child| {
                        if (child.node_type != .attribute) {
                            mem = child.render2(mem);
                        }
                    }
                }
                mem = mem.write("</");
                mem = mem.write(elem.name);
                mem = mem.write(">");
                return mem;
            },
            .text => |txt| {
                return _mem.write(txt.content);
            },
            .childless => |childlessElem| {
                var mem = _mem.write("<");
                mem = mem.write(childlessElem.name);
                if (childlessElem.children) |children| {
                    for (children) |*child| {
                        assert(child.node_type == .attribute);
                        mem = child.render2(mem);
                    }
                }
                return mem.write("/>");
            },
            .attribute => |attr| {
                var mem = _mem.write(" ");
                mem = mem.write(attr.name);
                if (attr.value) |attrValue| {
                    mem = mem.write("=\"");
                    mem = mem.write(attrValue);
                    mem = mem.write("\"");
                }
                return mem;
            },
            .nodes => |nodes| {
                var mem = _mem;
                if (nodes.children) |children| {
                    for (children) |*child| {
                        mem = child.render2(mem);
                    }
                }
                return mem;
            },
        }
    }
    pub fn render(self: *const Node, mem: std.ArrayList(u8).Writer) renderErr!void {
        switch (self.data) {
            .element => |elem| {
                _ = try mem.write("<");
                _ = try mem.write(elem.name);
                if (elem.children) |children| {
                    for (children) |*child| {
                        if (child.node_type == .attribute) {
                            try child.render(mem);
                        }
                    }
                }
                _ = try mem.write(">");
                if (elem.children) |children| {
                    for (children) |*child| {
                        if (child.node_type != .attribute) {
                            try child.render(mem);
                        }
                    }
                }
                _ = try mem.write("</");
                _ = try mem.write(elem.name);
                _ = try mem.write(">");
            },
            .text => |txt| {
                _ = try mem.write(txt.content);
            },
            .childless => |childlessElem| {
                _ = try mem.write("<");
                _ = try mem.write(childlessElem.name);
                if (childlessElem.children) |children| {
                    for (children) |*child| {
                        assert(child.node_type == .attribute);
                        try child.render(mem);
                    }
                }
                _ = try mem.write("/>");
            },
            .attribute => |attr| {
                _ = try mem.write(" ");
                _ = try mem.write(attr.name);
                if (attr.value) |attrValue| {
                    _ = try mem.write("=\"");
                    _ = try mem.write(attrValue);
                    _ = try mem.write("\"");
                }
            },
            .nodes => |nodes| {
                if (nodes.children) |children| {
                    for (children) |*child| {
                        try child.render(mem);
                    }
                }
            },
        }
    }

    pub fn element(name: []const u8, children: ?[]const Node) Node {
        return Node{
            .node_type = .element,
            .data = .{ .element = .{ .name = name, .children = children } },
        };
    }

    pub fn toNodes(children: ?[]const Node) Node {
        return Node{
            .node_type = .element,
            .data = .{ .nodes = .{ .children = children } },
        };
    }

    pub fn text(content: []const u8) Node {
        return Node{
            .node_type = .text,
            .data = .{ .text = .{ .content = content } },
        };
    }

    pub fn childlessElement(name: []const u8, children: ?[]const Node) Node {
        return Node{
            .node_type = .childless,
            .data = .{ .childless = .{ .name = name, .children = children } },
        };
    }

    pub fn attribute(name: []const u8, value: ?[]const u8) Node {
        return Node{
            .node_type = .attribute,
            .data = .{ .attribute = .{ .name = name, .value = value } },
        };
    }
};
