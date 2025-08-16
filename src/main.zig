const std = @import("std");
const z = @import("zigomponents");
const el = z.el;
const attr = z.attr;
const Node = z.Node;

pub fn main() !void {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

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
        }),
        el.Body(&.{el.Div(&.{el.Text("Hello world!")})}),
    });

    try html.render(writer);

    const res = arr.items;

    try std.testing.expectEqualStrings(res, "<html><head><title>My Page</title></head><body><div>Hello world!</div></body></html>");
}

test "html5" {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();
    const writer = arr.writer();

    const html = el.Html(&.{
        attr.Lang("en"),
        el.Head(&.{
            el.Meta(&.{attr.Charset("UTF-8")}),
            el.Meta(&.{ attr.Name("viewport"), attr.Content("\"width=device-width, initial-scale=1\"") }),
            el.Title(&.{el.Text("Document")}),
        }),
        el.Body(&.{el.Div(&.{
            attr.Class("my-class"),
            attr.Data("username", "johndoes"),
            el.Text("Hello world!"),
        })}),
    });

    try html.render(writer);

    const res = arr.items;

    try std.testing.expectEqualStrings(res, "<html lang=en><head><meta charset=UTF-8/><meta name=viewport content=\"width=device-width, initial-scale=1\"/><title>Document</title></head><body><div class=my-class data-username=johndoes>Hello world!</div></body></html>");
}
