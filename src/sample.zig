const std = @import("std");
const z = @import("zigomponents");
const el = z.el;
const attr = z.attr;
const eg = @import("examples.zig");
const formExample = eg.formExample;
const cardExample = eg.cardExample;
const mainExample = eg.mainExample;
const addDependency = eg.addDependency;
const importDependency = eg.importDependency;
const useComponents = eg.useComponents;

fn NavLink(label: []const u8, href: []const u8) [3]z.Node {
    return .{
        attr.Href(href),
        attr.Class("text-gray-600 hover:text-orange-500 transition-colors"),
        el.Text(label),
    };
}

fn Features(_title: []const u8, _text: []const u8) type {
    return struct {
        const title = .{
            attr.Class("text-xl font-semibold text-gray-900 mb-2"),
            el.Text(_title),
        };
        const text = .{
            attr.Class("text-gray-600"),
            el.Text(_text),
        };

        fn New() [3]z.Node {
            return .{
                attr.Class("bg-white p-6 rounded-xl shadow-sm"),
                el.Div(&title),
                el.Div(&text),
            };
        }
    };
}

fn Code(text: []const u8) type {
    return struct {
        const code = el.Div(&.{
            attr.Class("bg-gray-900 rounded-lg p-4"),
            el.Pre(&.{el.Code(&.{
                attr.Class("language-zig"),
                el.Text(text),
            })}),
        });

        fn New() z.Node {
            return code;
        }
    };
}

fn Snippet(title: []const u8, text: []const u8) type {
    return struct {
        const snip = el.Div(&.{
            attr.Class("bg-white rounded-xl p-6 shadow-sm"),
            el.H4(&.{
                attr.Class("text-xl font-semibold text-gray-900 mb-4"),
                el.Text(title),
            }),
            Code(text).New(),
        });

        fn New() z.Node {
            return snip;
        }
    };
}

pub fn run(writer: std.ArrayList(u8).Writer) !void {
    const head = el.Head(&.{
        el.Meta(&.{attr.Charset("UTF-8")}),
        el.Meta(&.{ attr.Name("viewport"), attr.Content("width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0") }),
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
                    attr.Class("flex items-center space-x-3 flex-shrink-0"),
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
                    attr.Class("hidden md:flex items-center space-x-6"),
                    el.A(&NavLink("Features", "#features")),
                    el.A(&NavLink("Examples", "#examples")),
                    el.A(&NavLink("Getting Started", "#getting-started")),
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
                attr.Class("text-4xl md:text-5xl font-bold text-gray-900 mb-6"),
                el.Text("HTML Generation for "),
                el.Span(&.{
                    attr.Class("text-orange-500"),
                    el.Text("Zig"),
                }),
            }),
            el.P(&.{
                attr.Class("text-lg md:text-xl text-gray-600 mb-8 max-w-3xl mx-auto px-4"),
                el.Text("Zigomponent is a Zig library inspired by gomponents that allows you to create HTML elements using native Zig syntax. Build type-safe, composable HTML components with the power of Zig."),
            }),
            el.Div(&.{
                attr.Class("flex flex-col md:flex-row justify-center space-y-4 md:space-y-0 md:space-x-4"),
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
                el.Div(&Features("Type Safety", "Leverage Zig's compile-time type checking to catch HTML errors before runtime.").New()),
                el.Div(&Features("Performance", "Zero-cost abstractions and compile-time optimizations for blazing fast HTML generation.").New()),
                el.Div(&Features("Composable", "Build reusable components and compose them together for complex layouts.").New()),
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
            Code(mainExample).New(),
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
                                attr.Href("https://github.com/eltNEG/zigomponent/blob/master/src/sample.zig"),
                                attr.Target("_blank"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("Example"),
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
                                attr.Href("https://github.com/eltNEG/zigomponent"),
                                attr.Target("_blank"),
                                attr.Class("hover:text-white transition-colors"),
                                el.Text("GitHub"),
                            }),
                        }),
                    }),
                }),
            }),
            el.Div(&.{
                attr.Class("border-t border-gray-800 mt-8 pt-8 text-center text-gray-400"),
                el.P(&.{
                    el.Text("© 2025 Zigomponent. MIT License."),
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
                attr.Class("grid grid-cols-1 lg:grid-cols-2 gap-8 px-4"),
                Snippet("Creating a Form", formExample).New(),
                Snippet("Custom Components", cardExample).New(),
            }),
        }),
    });

    const gettingStarted = el.Section(&.{
        attr.ID("getting-started"),
        attr.Class("py-16 bg-gray-50"),
        el.Div(&.{
            attr.Class("max-w-4xl mx-auto px-4 sm:px-6 lg:px-8"),
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
                Snippet("1. Add to your build.zig", addDependency).New(),
                Snippet("2. Import in your code", importDependency).New(),
                Snippet("3. Use in your code", useComponents).New(),
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

    const html = el.ToNode(&.{
        el.Raw("<!DOCTYPE html>"),
        el.Html(&.{
            attr.Lang("en"),
            head,
            body,
        }),
    });

    try html.render(writer);
}
