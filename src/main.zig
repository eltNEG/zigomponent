const std = @import("std");
const zigomponents = @import("zigomponents");
const el = @import("./components/htmlcomponents.zig");
const Node = @import("./interfaces/node.zig").Node;

pub fn main() !void {
    const result = zigomponents.Build();
    std.debug.print("Build result: {s}\n", .{result});

    const p = el.P(null);
    const div = el.Div(null);
    var children = [_]Node{ div, p, el.Area(null) };
    var body = el.Body(&children);

    try body.render();
}
