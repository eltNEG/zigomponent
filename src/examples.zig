pub const mainExample =
    \\const std = @import("std");
    \\const z = @import("zigomponent");
    \\const el = z.el;
    \\const attr = z.attr;
    \\
    \\pub fn main() !void {
    \\    const allocator = std.heap.page_allocator;
    \\    var arr: std.ArrayList(u8) = .{};
    \\    defer arr.deinit(allocator);
    \\    const writer = arr.writer(allocator);
    \\    const docType = "\<\!DOCTYPE html\>"; // remove all '\' on this line
    \\
    \\    const html = el.ToNode(&.{
    \\        el.Raw(docType),
    \\        el.Html(&.{
    \\            attr.Lang("en"),
    \\            el.Head(&.{
    \\                el.Meta(&.{attr.Charset("UTF-8")}),
    \\                el.Meta(&.{ attr.Name("viewport"), attr.Content("width=device-width, initial-scale=1") }),
    \\                el.Title(&.{el.Text("Document")}),
    \\            }),
    \\            el.Body(&.{el.Div(&.{
    \\                el.H1(&.{
    \\                    attr.Style("color: blue; margin-top: 20px; margin-bottom: 20px;"),
    \\                    el.Text("Welcome to Zigomponent!"),
    \\                }),
    \\                el.P(&.{
    \\                    el.Text("Build HTML with the power of Zig."),
    \\                }),
    \\                el.Button(&.{
    \\                    attr.OnClick("alert('Hello from Zig!')"),
    \\                    el.Text("Click me!"),
    \\                }),
    \\            })}),
    \\        }),
    \\    });
    \\
    \\    try html.render(writer);
    \\
    \\    const res = arr.items;
    \\    std.debug.print("{s}", .{res});
    \\}
    \\
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
    \\fn Card(title: []const u8, content: []const u8) type {
    \\    return struct {
    \\        const card = el.Div(&.{
    \\            attr.Class("card shadow-lg"),
    \\            el.Div(&.{
    \\                attr.Class("card-header"),
    \\                el.H3(&.{
    \\                    el.Text(title),
    \\                }),
    \\            }),
    \\            el.Div(&.{
    \\                attr.Class("card-body"),
    \\                el.P(&.{
    \\                    el.Text(content),
    \\                }),
    \\            }),
    \\        });
    \\
    \\        fn New() z.Node {
    \\            return card;
    \\        }
    \\    };
    \\}
;

pub const addDependency =
    \\b.installArtifact(exe); // This line should already be in your build.zig file
    \\
    \\const zigomponent = b.dependency("zigomponent", .{
    \\    .target = target,
    \\    .optimize = optimize,
    \\});
    \\
    \\exe.root_module.addImport("zigomponent", zigomponent.module("zigomponent"));
;

pub const importDependency =
    \\const z = @import("zigomponent");
    \\const el = z.el;
    \\const attr = z.attr;
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
