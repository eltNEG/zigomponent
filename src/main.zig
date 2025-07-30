const std = @import("std");
const zigomponents = @import("zigomponents");
const el = @import("./components/htmlcomponents.zig");
const cel = @import("./components/childlesscomponents.zig");
const attr = @import("./components/atributes.zig");
const Node = @import("./interfaces/node.zig").Node;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

    const result = zigomponents.Build();
    std.debug.print("Build result: {s}\n", .{result});

    const p = el.P(&.{ el.Text("This is a paragraph."), cel.Input(&.{attr.Required()}) });
    const div = el.Div(&.{el.Text("Hello world!")});

    const html = el.Html(&.{el.Body(&.{ div, p })});

    const writer = arr.writer();

    try html.render(writer);

    const res = arr.items;

    std.debug.print("Rendered HTML: {s}\n", .{res});
}
