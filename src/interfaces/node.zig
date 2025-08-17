const std = @import("std");
const assert = @import("std").debug.assert;
const renderErr = @import("../errors/render.zig").RenderError;

pub const NodeType = enum { element, text, childless, attribute };

pub const Node = struct {
    node_type: NodeType,
    data: NodeData,

    const NodeData = union(NodeType) { element: ElementData, text: TextData, childless: ChildessElementData, attribute: AtrributeData };

    const ElementData = struct {
        name: []const u8,
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
        }
    }

    pub fn element(name: []const u8, children: ?[]const Node) Node {
        return Node{
            .node_type = .element,
            .data = .{ .element = .{ .name = name, .children = children } },
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
