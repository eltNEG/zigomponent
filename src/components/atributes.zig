const Node = @import("../interfaces/node.zig").Node;
const Attr = @import("./element.zig").Attr;

pub fn Required() Node {
    return Attr("required", null);
}
