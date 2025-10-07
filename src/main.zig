const std = @import("std");
const z = @import("zigomponents");
const el = z.el;
const attr = z.attr;
const Node = z.Node;
const sample = @import("sample.zig");
const server = @import("server.zig");

pub fn main() !void {
    // var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    // const allocator = gpa.allocator();
    // defer {
    //     const deinit_status = gpa.deinit();
    //     if (deinit_status == .leak) std.testing.expect(false) catch @panic("Leak detected!");
    // }
    // var arr: std.ArrayList(u8) = .{}; //.init(allocator);
    // defer arr.deinit(allocator);
    // const writer = arr.writer(allocator);
    // try sample.run(writer);
    // const samplePage = arr.items;
    // comptime {
    //      = sample.run2();
    // }
    @setEvalBranchQuota(5000);
    const samplePage = comptime sample.run2();
    try server.runServer(@constCast(samplePage));
}

fn Page(n: []const Node) Node {
    const html = el.Html(n);
    return html;
}

test "components" {
    const allocator = std.heap.page_allocator;
    var arr: std.ArrayList(u8) = .{}; //.init(allocator);
    defer arr.deinit(allocator);
    const writer = arr.writer(allocator);

    const html = Page(&.{
        el.Head(&.{
            el.Title("My Page"),
        }),
        el.Body(&.{el.Div(&.{el.Text("Hello world!")})}),
    });

    try html.render(writer);

    const res = arr.items;

    try std.testing.expectEqualStrings(res, "<html><head><title>My Page</title></head><body><div>Hello world!</div></body></html>");
}

fn Writer(comptime T: type, comptime initial: []const T, comptime new: []const T) type {
    return struct {
        const store: []const T = initial ++ new;

        fn Write(comptime value: []const T) type {
            return Writer(T, store, value);
        }

        fn Value() []const T {
            return store;
        }
        // store: []const T = initial ++ new,

        // const Self = @This();

        // fn Write(self: *Self, comptime value: []const T) type {
        //     return Writer(T, self.store, value);
        // }

        // fn Value(self: *Self) []const T {
        //     return self.store;
        // }
    };
}

test "html5" {
    const allocator = std.heap.page_allocator;
    var arr: std.ArrayList(u8) = .{}; //.init(allocator);
    defer arr.deinit(allocator);
    const writer = arr.writer(allocator);

    const html = el.Html(&.{
        attr.Lang("en"),
        el.Head(&.{
            el.Meta(&.{attr.Charset("UTF-8")}),
            el.Meta(&.{ attr.Name("viewport"), attr.Content("width=device-width, initial-scale=1") }),
            el.Title("Document"),
        }),
        el.Body(&.{el.Div(&.{
            attr.Class("my-class"),
            attr.Data("username", "johndoes"),
            el.Text("Hello world!"),
        })}),
    });

    try html.render(writer);

    const res = arr.items;

    try std.testing.expectEqualStrings(res, "<html lang=\"en\"><head><meta charset=\"UTF-8\"/><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/><title>Document</title></head><body><div class=\"my-class\" data-username=\"johndoes\">Hello world!</div></body></html>");
}

test "comptime allocation" {
    const a: []const u8 = "Hello";
    const b: []const u8 = " World";
    var c: []const u8 = "";
    c = comptime blk: {
        break :blk a ++ b;
    };

    // c = c ++ "!!";

    std.debug.print("{d}", .{c.len});

    try std.testing.expectEqualStrings(c, "Hello World");

    const writer = Writer(u8, "Hello", " World");

    const e = writer.Write("!!").Write("==").Value();
    try std.testing.expectEqualStrings(e, "Hello World!!==");
}
