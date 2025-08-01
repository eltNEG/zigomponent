const std = @import("std");
const zigomponents = @import("zigomponents");
const el = @import("./components/htmlcomponents.zig");
const Node = @import("./interfaces/node.zig").Node;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

    const result = zigomponents.Build();
    std.debug.print("Build result: {s}\n", .{result});

    const p = el.P(&.{el.Text("This is a paragraph.")});
    const div = el.Div(&.{el.Text("Hello world!")});

    const html = el.Html(&.{el.Body(&.{ div, p })});

    const writer = arr.writer();

    try html.render(writer);

    const res = arr.items;

    std.debug.print("Rendered HTML: {s}\n", .{res});
}

fn Page(n: []const Node) Node {
    const html = el.Html(n);
    return html;
}

test "components" {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();
    const writer = arr.writer();

    const html = Page(&.{
        el.Head(&.{
            el.Title(&.{el.Text("My Page")}),
            // el.Title2("My Page0"), // This isn't working!
        }),
        el.Body(&.{el.Div(&.{el.Text("Hello world!")})}),
    });

    try html.render(writer);

    const res = arr.items;

    try std.testing.expectEqualStrings(res, "<html><head><title>My Page</title></head><body><div>Hello world!</div></body></html>");
}
