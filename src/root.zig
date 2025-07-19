const std = @import("std");

pub fn Build() []const u8 {
    return "<html>Hello, World!</html>";
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "Build" {
    const expected = "<html>Hello, World!</html>";
    try std.testing.expect(std.mem.eql(u8, Build(), expected));
}
