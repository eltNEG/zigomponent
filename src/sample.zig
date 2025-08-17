const std = @import("std");
const z = @import("zigomponents");
const el = z.el;
const attr = z.attr;

pub fn run() !void {
    const allocator = std.heap.page_allocator;
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();
    const writer = arr.writer();

    const head = el.Head(&.{
        el.Meta(&.{attr.Charset("UTF-8")}),
        el.Meta(&.{ attr.Name("viewport"), attr.Content("width=device-width, initial-scale=1.0") }),
        el.Title(&.{el.Text("Zigomponent - HTML Generation for Zig")}),
        el.Script(&.{attr.Src("https://cdn.tailwindcss.com")}),
        el.Link(&.{
            attr.Href("https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/themes/prism-tomorrow.min.css"),
            attr.Rel("stylesheet"),
        }),
        el.Script(&.{
            attr.Src("https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/components/prism-core.min.js"),
        }),
        el.Script(&.{
            attr.Src("https://cdnjs.cloudflare.com/ajax/libs/prism/1.29.0/plugins/autoloader/prism-autoloader.min.js"),
        }),
    });

    const header = el.Header(&.{
        attr.Class("bg-white shadow-sm border-b"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4 py-6"),
            el.Div(&.{
                attr.Class("flex items-center justify-between"),
                el.Div(&.{
                    attr.Class("flex items-center space-x-3"),
                    el.Div(&.{
                        attr.Class("w-10 h-10 bg-orange-500 rounded-lg flex items-center justify-center"),
                        el.Span(&.{
                            attr.Class("text-white font-bold text-xl"),
                            el.Text("Z"),
                        }),
                    }),
                    el.H1(&.{
                        attr.Class("text-2xl font-bold text-gray-900"),
                        el.Text("zigomponent"),
                    }),
                }),
                el.Nav(&.{
                    attr.Class("flex space-x-6"),
                    el.A(&.{
                        attr.Href("#features"),
                        attr.Class("text-gray-600 hover:text-orange-500 transition-colors"),
                        el.Text("Features"),
                    }),
                    el.A(&.{
                        attr.Href("#examples"),
                        attr.Class("text-gray-600 hover:text-orange-500 transition-colors"),
                        el.Text("Examples"),
                    }),
                    el.A(&.{
                        attr.Href("#getting-started"),
                        attr.Class("text-gray-600 hover:text-orange-500 transition-colors"),
                        el.Text("Get Started"),
                    }),
                    el.A(&.{
                        attr.Href("https://github.com/eltNEG/zigomponent"),
                        attr.Class("bg-orange-500 text-white px-4 py-2 rounded-lg hover:bg-orange-600 transition-colors"),
                        el.Text("GitHub"),
                    }),
                }),
            }),
        }),
    });

    const hero = el.Section(&.{
        attr.Class("bg-gradient-to-br from-orange-50 to-amber-50 py-20"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4 text-center"),
            el.H2(&.{
                attr.Class("text-5xl font-bold text-gray-900 mb-6"),
                el.Text("HTML Generation for "),
                el.Span(&.{
                    attr.Class("text-orange-500"),
                    el.Text("Zig"),
                }),
            }),
            el.P(&.{
                attr.Class("text-xl text-gray-600 mb-8 max-w-3xl mx-auto"),
                el.Text("Zigomponent is a Zig library inspired by gomponents that allows you to create HTML elements using native Zig syntax. Build type-safe, composable HTML components with the power of Zig."),
            }),
            el.Div(&.{
                attr.Class("flex justify-center space-x-4"),
                el.A(&.{
                    attr.Href("#getting-started"),
                    attr.Class("bg-orange-500 text-white px-8 py-3 rounded-lg text-lg font-semibold hover:bg-orange-600 transition-colors"),
                    el.Text("Get Started"),
                }),
                el.A(&.{
                    attr.Href("#examples"),
                    attr.Class("border-2 border-orange-500 text-orange-500 px-8 py-3 rounded-lg text-lg font-semibold hover:bg-orange-50 transition-colors"),
                    el.Text("View Examples"),
                }),
            }),
        }),
    });

    const features = el.Section(&.{
        attr.ID("features"),
        attr.Class("py-16 bg-gray-50"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4"),
            el.Div(&.{
                attr.Class("text-center mb-12"),
                el.H3(&.{
                    attr.Class("text-3xl font-bold text-gray-900 mb-4"),
                    el.Text("Why Zigomponent?"),
                }),
                el.P(&.{
                    attr.Class("text-lg text-gray-600"),
                    el.Text("Powerful features for modern web development"),
                }),
            }),
            el.Div(&.{
                attr.Class("grid md:grid-cols-3 gap-8"),
                el.Div(&.{
                    attr.Class("bg-white p-6 rounded-xl shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-2"),
                        el.Text("Type Safety"),
                    }),
                    el.P(&.{
                        attr.Class("text-gray-600"),
                        el.Text("Leverage Zig's compile-time type checking to catch HTML errors before runtime."),
                    }),
                }),
                el.Div(&.{
                    attr.Class("bg-white p-6 rounded-xl shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-2"),
                        el.Text("Performance"),
                    }),
                    el.P(&.{
                        attr.Class("text-gray-600"),
                        el.Text("Zero-cost abstractions and compile-time optimizations for blazing fast HTML generation."),
                    }),
                }),
                el.Div(&.{
                    attr.Class("bg-white p-6 rounded-xl shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-2"),
                        el.Text("Composable"),
                    }),
                    el.P(&.{
                        attr.Class("text-gray-600"),
                        el.Text("Build reusable components and compose them together for complex layouts."),
                    }),
                }),
            }),
        }),
    });

    const codeExample = el.Section(&.{
        attr.Class("py-16 bg-white"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4"),
            el.Div(&.{
                attr.Class("text-center mb-12"),
                el.H3(&.{
                    attr.Class("text-3xl font-bold text-gray-900 mb-4"),
                    el.Text("Simple and Intuitive"),
                }),
                el.P(&.{
                    attr.Class("text-lg text-gray-600"),
                    el.Text("Create HTML elements with native Zig syntax"),
                }),
            }),
            el.Div(&.{
                attr.Class("bg-gray-900 rounded-xl p-6 overflow-x-auto"),
                el.Pre(&.{
                    el.Code(&.{
                        attr.Class("language-zig"),
                        el.Text(
                            \\const allocator = std.heap.page_allocator;
                            \\var arr = std.ArrayList(u8).init(allocator);
                            \\defer arr.deinit();
                            \\const writer = arr.writer();
                            \\
                            \\const html = el.Html(.{
                            \\    .children = &.{
                            \\        el.Head(.{
                            \\            .children = &.{
                            \\                el.Title(.{ .text = "My Zig App" }),
                            \\                el.Meta(.{ .charset = "UTF-8" }),
                            \\            },
                            \\        }),
                            \\        el.Body(.{
                            \\            .children = &.{
                            \\                el.H1(.{
                            \\                    .text = "Welcome to Zigomponent!",
                            \\                    .class = "text-4xl font-bold text-center"
                            \\                }),
                            \\                el.P(.{
                            \\                    .text = "Build HTML with the power of Zig.",
                            \\                    .class = "text-lg text-gray-600 mt-4"
                            \\                }),
                            \\                el.Button(.{
                            \\                    .text = "Click me!",
                            \\                    .onclick = "alert('Hello from Zig!')",
                            \\                    .class = "bg-blue-500 text-white px-4 py-2 rounded"
                            \\                }),
                            \\            },
                            \\        }),
                            \\    },
                            \\});
                            \\
                            \\try html.render(writer);
                        ),
                    }),
                }),
            }),
        }),
    });

    const script = el.Script(&.{
        el.Text(
            \\document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
            \\    anchor.addEventListener("click", function (e) {
            \\        e.preventDefault();
            \\        const target = document.querySelector(this.getAttribute("href"));
            \\        if (target) {
            \\            target.scrollIntoView({
            \\                behavior: "smooth",
            \\                block: "start",
            \\            });
            \\        }
            \\    });
            \\});
        ),
    });

    const footer = el.Footer(&.{
        attr.Class("bg-gray-900 text-white py-12"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4"),
            el.Div(&.{
                attr.Class("grid md:grid-cols-4 gap-8"),
                el.Div(&.{
                    attr.Class("md:col-span-2"),
                    el.Div(&.{
                        attr.Class("flex items-center space-x-3 mb-4"),
                        el.Div(&.{
                            attr.Class("w-8 h-8 bg-orange-500 rounded-lg flex items-center justify-center"),
                            el.Span(&.{
                                attr.Class("text-white font-bold"),
                                el.Text("Z"),
                            }),
                        }),
                        el.H5(&.{
                            attr.Class("text-xl font-bold"),
                            el.Text("zigomponent"),
                        }),
                    }),
                    el.P(&.{
                        attr.Class("text-gray-400 mb-4"),
                        el.Text("HTML generation for Zig, inspired by gomponents. Build type-safe, composable HTML components with the power of Zig."),
                    }),
                }),
                el.Div(&.{
                    el.H6(&.{
                        attr.Class("font-semibold mb-4"),
                        el.Text("Resources"),
                    }),
                    el.Ul(&.{
                        attr.Class("space-y-2 text-gray-400"),
                        el.Li(&.{
                            el.A(&.{
                                attr.Href("#"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("Documentation"),
                            }),
                        }),
                        el.Li(&.{
                            el.A(&.{
                                attr.Href("#"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("Examples"),
                            }),
                        }),
                    }),
                }),
                el.Div(&.{
                    el.H6(&.{
                        attr.Class("font-semibold mb-4"),
                        el.Text("Community"),
                    }),
                    el.Ul(&.{
                        attr.Class("space-y-2 text-gray-400"),
                        el.Li(&.{
                            el.A(&.{
                                attr.Href("#"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("GitHub"),
                            }),
                        }),
                        el.Li(&.{
                            el.A(&.{
                                attr.Href("#"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("Discord"),
                            }),
                        }),
                    }),
                }),
            }),
            el.Div(&.{
                attr.Class("border-t border-gray-800 mt-8 pt-8 text-center text-gray-400"),
                el.P(&.{
                    el.Text("© 2024 Zigomponent. MIT License."),
                }),
            }),
        }),
    });

    const moreExamples = el.Section(&.{
        attr.ID("examples"),
        attr.Class("py-16 bg-white"),
        el.Div(&.{
            attr.Class("max-w-6xl mx-auto px-4"),
            el.Div(&.{
                attr.Class("text-center mb-12"),
                el.H3(&.{
                    attr.Class("text-3xl font-bold text-gray-900 mb-4"),
                    el.Text("More Examples"),
                }),
                el.P(&.{
                    attr.Class("text-lg text-gray-600"),
                    el.Text("See zigomponent in action"),
                }),
            }),
            el.Div(&.{
                attr.Class("grid lg:grid-cols-2 gap-8"),
                el.Div(&.{
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                        el.Text("Creating a Form"),
                    }),
                    el.Div(&.{
                        attr.Class("bg-gray-900 rounded-lg p-4 overflow-x-auto"),
                        el.Pre(&.{el.Code(&.{
                            attr.Class("language-zig"),
                            el.Text(
                                \\const form = el.Form(.{
                                \\    .action = "/submit",
                                \\    .method = "POST",
                                \\    .children = &.{
                                \\        el.Input(.{
                                \\            .type = "text",
                                \\            .name = "username",
                                \\            .placeholder = "Enter username",
                                \\            .required = true,
                                \\        }),
                                \\        el.Input(.{
                                \\            .type = "password",
                                \\            .name = "password",
                                \\            .placeholder = "Enter password",
                                \\            .required = true,
                                \\        }),
                                \\        el.Button(.{
                                \\            .type = "submit",
                                \\            .text = "Login",
                                \\            .class = "btn btn-primary",
                                \\        }),
                                \\    },
                                \\});
                            ),
                        })}),
                    }),
                }),
                el.Div(&.{
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                        el.Text("Custom Components"),
                    }),
                    el.Div(&.{
                        attr.Class("bg-gray-900 rounded-lg p-4 overflow-x-auto"),
                        el.Pre(&.{el.Code(&.{
                            attr.Class("language-zig"),
                            el.Text(
                                \\fn Card(title: []const u8, content: []const u8) Element {
                                \\    return el.Div(.{
                                \\        .class = "card shadow-lg",
                                \\        .children = &.{
                                \\            el.Div(.{
                                \\                .class = "card-header",
                                \\                .children = &.{
                                \\                    el.H3(.{ .text = title }),
                                \\                },
                                \\            }),
                                \\            el.Div(.{
                                \\                .class = "card-body",
                                \\                .children = &.{
                                \\                    el.P(.{ .text = content }),
                                \\                },
                                \\            }),
                                \\        },
                                \\    });
                                \\}
                            ),
                        })}),
                    }),
                }),
            }),
        }),
    });

    const gettingStarted = el.Section(&.{
        attr.ID("getting-started"),
        attr.Class("py-16 bg-gray-50"),
        el.Div(&.{
            attr.Class("max-w-4xl mx-auto px-4"),
            el.Div(&.{
                attr.Class("text-center mb-12"),
                el.H3(&.{
                    attr.Class("text-3xl font-bold text-gray-900 mb-4"),
                    el.Text("Getting Started"),
                }),
                el.P(&.{
                    attr.Class("text-lg text-gray-600"),
                    el.Text("Add zigomponent to your Zig project in minutes"),
                }),
            }),
            el.Div(&.{
                attr.Class("space-y-8"),
                el.Div(&.{
                    attr.Class("bg-white rounded-xl p-6 shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                        el.Text("1. Add to your build.zig"),
                    }),
                    el.Div(&.{
                        attr.Class("bg-gray-900 rounded-lg p-4"),
                        el.Pre(&.{el.Code(&.{
                            attr.Class("language-zig"),
                            el.Text(
                                \\const zigomponent = b.dependency("zigomponent", .{
                                \\    .target = target,
                                \\    .optimize = optimize,
                                \\});
                                \\
                                \\exe.root_module.addImport("zigomponent", zigomponent.module("zigomponent"));
                            ),
                        })}),
                    }),
                }),
                el.Div(&.{
                    attr.Class("bg-white rounded-xl p-6 shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                        el.Text("2. Import in your code"),
                    }),
                    el.Div(&.{
                        attr.Class("bg-gray-900 rounded-lg p-4"),
                        el.Pre(&.{el.Code(&.{
                            attr.Class("language-zig"),
                            el.Text(
                                \\const std = @import("std");
                                \\const el = @import("zigomponent");
                            ),
                        })}),
                    }),
                }),
                el.Div(&.{
                    attr.Class("bg-white rounded-xl p-6 shadow-sm"),
                    el.H4(&.{
                        attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                        el.Text("3. Start building"),
                    }),
                    el.Div(&.{
                        attr.Class("bg-gray-900 rounded-lg p-4"),
                        el.Pre(&.{el.Code(&.{
                            attr.Class("language-zig"),
                            el.Text(
                                \\const page = el.Html(.{
                                \\    .children = &.{
                                \\        el.Body(.{
                                \\            .children = &.{
                                \\                el.H1(.{ .text = "Hello, Zigomponent!" }),
                                \\            },
                                \\        }),
                                \\    },
                                \\});
                            ),
                        })}),
                    }),
                }),
            }),
        }),
    });

    const body = el.Body(&.{
        attr.Class("bg-gray-50 text-gray-900"),
        header,
        hero,
        codeExample,
        features,
        moreExamples,
        gettingStarted,
        script,
        footer,
    });

    const html = el.Html(&.{
        attr.Lang("en"),
        head,
        body,
    });

    try html.render(writer);

    const fs = std.fs.cwd();
    const file = try fs.createFile("output.html", .{});
    defer file.close();
    try file.writeAll(arr.items);
}
