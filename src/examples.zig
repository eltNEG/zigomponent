pub const mainExample =
    \\const allocator = std.heap.page_allocator;
    \\var arr = std.ArrayList(u8).init(allocator);
    \\defer arr.deinit();
    \\const writer = arr.writer();
    \\
    \\const html = el.Html(&.{
    \\    attr.Lang("en"),
    \\    el.Head(&.{
    \\        el.Title(&.{
    \\            el.Text("My Zig App"),
    \\        }),
    \\        el.Meta(&.{
    \\            attr.Charset("UTF-8"),
    \\        }),
    \\    }),
    \\    el.Body(&.{
    \\        el.H1(&.{
    \\            attr.Class("text-4xl font-bold text-center"),
    \\            el.Text("Welcome to Zigomponent!"),
    \\        }),
    \\        el.P(&.{
    \\            attr.Class("text-lg text-gray-600 mt-4"),
    \\            el.Text("Build HTML with the power of Zig."),
    \\        }),
    \\        el.Button(&.{
    \\            attr.Class("bg-blue-500 text-white px-4 py-2 rounded"),
    \\            attr.OnClick("alert('Hello from Zig!')"),
    \\            el.Text("Click me!"),
    \\        }),
    \\    }),
    \\});
    \\
    \\try html.render(writer);
;

pub const formExample =
    \\const form = el.Form(&.{
    \\    attr.Action("/submit"),
    \\    attr.Method("POST"),
    \\    el.Input(&.{
    \\        attr.Type("text"),
    \\        attr.Name("username"),
    \\        attr.Placeholder("Enter username"),
    \\        attr.Required(),
    \\    }),
    \\    el.Input(&.{
    \\        attr.Type("password"),
    \\        attr.Name("password"),
    \\        attr.Placeholder("Enter password"),
    \\        attr.Required(),
    \\    }),
    \\    el.Button(&.{
    \\        attr.Type("submit"),
    \\        attr.Class("btn btn-primary"),
    \\        el.Text("Login"),
    \\    }),
    \\});
;

pub const cardExample =
    \\fn Card(title: []const u8, content: []const u8) Node {
    \\    return el.Div(&.{
    \\        attr.Class("card shadow-lg"),
    \\        el.Div(&.{
    \\            attr.Class("card-header"),
    \\            el.H3(&.{
    \\                el.Text(title),
    \\            }),
    \\        }),
    \\        el.Div(&.{
    \\            attr.Class("card-body"),
    \\            el.P(&.{
    \\                el.Text(content),
    \\            }),
    \\        }),
    \\    });
    \\}
;

pub const addDependency =
    \\const zigomponent = b.dependency("zigomponent", .{
    \\    .target = target,
    \\    .optimize = optimize,
    \\});
    \\
    \\exe.root_module.addImport("zigomponent", zigomponent.module("zigomponent"));
;

pub const importDependency =
    \\const std = @import("std");
    \\const el = @import("zigomponent");
;

pub const useComponents =
    \\const page = el.Html(&.{
    \\    attr.Lang("en"),
    \\    el.Body(&.{
    \\        el.H1(&.{
    \\            el.Text("Hello, Zigomponent!"),
    \\        }),
    \\    }),
    \\});
;
