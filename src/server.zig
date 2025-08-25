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

    const favicon = @embedFile("assets/favicon.ico");
    const appleTouchIcon = @embedFile("assets/apple-touch-icon.png");
    const icon32 = @embedFile("assets/favicon-32x32.png");
    const icon16 = @embedFile("assets/favicon-16x16.png");
    const manifest = @embedFile("assets/site.webmanifest");
    const androidChrome512 = @embedFile("assets/android-chrome-512x512.png");
    const androidChrome192 = @embedFile("assets/android-chrome-192x192.png");
    const assets = [_][]const u8{ favicon, appleTouchIcon, icon32, icon16, manifest, androidChrome512, androidChrome192 };

    while (true) {
        const conn = server.accept() catch |err| {
            log.err("failed to accept connection: {s}", .{@errorName(err)});
            continue;
        };
        _ = std.Thread.spawn(.{}, accept, .{ conn, page, &assets }) catch |err| {
            log.err("unable to spawn connection thread: {s}", .{@errorName(err)});
            conn.stream.close();
            continue;
        };
    }
}

fn accept(conn: Connection, page: []u8, assets: []const []const u8) !void {
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

        try serveHTTP(&request, page, assets);
    }
}

fn serveHTTP(request: *Request, page: []u8, assets: []const []const u8) !void {
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/favicon.ico")) {
        try request.respond(
            assets[0],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/apple-touch-icon.png")) {
        try request.respond(
            assets[1],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/favicon-32x32.png")) {
        try request.respond(
            assets[2],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/favicon-16x16.png")) {
        try request.respond(
            assets[3],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/site.webmanifest")) {
        try request.respond(
            assets[4],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/android-chrome-192x192.png")) {
        try request.respond(
            assets[5],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/android-chrome-512x512.png")) {
        try request.respond(
            assets[6],
            .{},
        );
        return;
    }
    if (request.head.method == .GET and std.mem.eql(u8, request.head.target, "/")) {
        try request.respond(
            page,
            .{},
        );
    }

    try request.respond("Not Found", .{
        .status = .not_found,
    });
}
