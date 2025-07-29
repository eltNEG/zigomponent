const renderErr = @import("../errors/render.zig").RenderError;
const Node = @import("../interfaces/node.zig").Node;

const node = struct {
    pub fn render(self: *node) !void {
        _ = self;
        return;
    }
};

pub fn El(name: []const u8, nodes: ?[]Node) Node {
    if (nodes != null) {
        const _nodes = nodes.?;
        for (_nodes) |n| {
            n.render() catch {};
        }
    }
    _ = name;
    // _ = nodes;
    var n = node{};
    const nodeEl = Node.init(&n);
    return nodeEl;
}
