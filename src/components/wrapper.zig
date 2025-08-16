const std = @import("std");
const renderErr = @import("../errors/render.zig").RenderError;
const Node = @import("../interfaces/node.zig").Node;

pub fn El(name: []const u8, children: ?[]const Node) Node {
    return Node.element(name, children);
}

pub fn Attr(name: []const u8, value: ?[]const u8) Node {
    return Node.attribute(name, value);
}

pub fn Childless(name: []const u8, children: ?[]const Node) Node {
    return Node.childlessElement(name, children);
}
