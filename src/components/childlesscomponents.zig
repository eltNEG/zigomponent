const Node = @import("../interfaces/node.zig").Node;
const EL = @import("./element.zig").El;
const Childless = @import("./element.zig").Childless;

pub fn Input(nodes: ?[]const Node) Node {
    return Childless("input", nodes);
}
