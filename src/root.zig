const std = @import("std");
pub const el = @import("./components/elements.zig");
pub const attr = @import("./components/atributes.zig");
pub const wrappers = @import("./components/wrapper.zig");
pub const Node = @import("./interfaces/node.zig").Node;
pub const Writer = @import("./interfaces/node.zig").Writer;

test {
    std.testing.log_level = .warn;
    std.testing.refAllDeclsRecursive(@This());
}
