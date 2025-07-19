const std = @import("std");
const zigomponents = @import("zigomponents");

pub fn main() !void {
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});
    const result = zigomponents.Build();
    std.debug.print("Build result: {s}\n", .{result});
}
