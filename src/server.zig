const std = @import("std");
const log = std.log;
const WebSocket = std.http.WebSocket;
const Request = std.http.Server.Request;
const Connection = std.net.Server.Connection;

const MAX_BUF = 1024;

pub fn runServer(page: []u8) !void {
    const addr = try std.net.Address.parseIp("0.0.0.0", 3006);
    var server = try std.net.Address.listen(addr, .{ .reuse_address = true });
    defer server.deinit();

    log.info("Start HTTP server at {s}", .{"http://localhost:3006"});

    while (true) {
        const conn = server.accept() catch |err| {
            log.err("failed to accept connection: {s}", .{@errorName(err)});
            continue;
        };
        _ = std.Thread.spawn(.{}, accept, .{ conn, page }) catch |err| {
            log.err("unable to spawn connection thread: {s}", .{@errorName(err)});
            conn.stream.close();
            continue;
        };
    }
}

fn accept(conn: Connection, page: []u8) !void {
    defer conn.stream.close();
    var read_buffer: [MAX_BUF]u8 = undefined;
    var in = conn.stream.reader(&read_buffer);
    var write_buffer: [MAX_BUF]u8 = undefined;
    var out = conn.stream.writer(&write_buffer);
    var server = std.http.Server.init(in.interface(), &out.interface);
    while (server.reader.state == .ready) {
        var request = server.receiveHead() catch |err| switch (err) {
            error.HttpConnectionClosing => return,
            else => return err,
        };

        try serveHTTP(&request, page);
    }
}

fn serveHTTP(request: *Request, page: []u8) !void {
    try request.respond(
        page,
        .{},
    );
}
