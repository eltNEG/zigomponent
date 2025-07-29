const assert = @import("std").debug.assert;
const renderErr = @import("../errors/render.zig").RenderError;

pub const Node = struct {
    // define interface fields: ptr,vtab
    ptr: *anyopaque, //ptr to instance
    vtab: *const VTab, //ptr to vtab

    const VTab = struct { // @1/4
        render: *const fn (ptr: *anyopaque) renderErr!void,
    };

    // define interface methods wrapping vtable calls
    pub fn render(self: Node) renderErr!void { // @2/4
        return self.vtab.render(self.ptr);
    }

    // cast concrete implementation types/objs to interface
    pub fn init(obj: anytype) Node {
        const Ptr = @TypeOf(obj);
        const PtrInfo = @typeInfo(Ptr);
        // @import("std").builtin.Type
        assert(PtrInfo == .pointer); // Must be a pointer
        assert(PtrInfo.pointer.size == .one); // Must be a single-item pointer
        assert(@typeInfo(PtrInfo.pointer.child) == .@"struct"); // Must point to a struct
        const impl = struct {
            fn render(ptr: *anyopaque) renderErr!void { // @3/4
                const self: Ptr = @ptrCast(@alignCast(ptr));
                return self.render();
            }
        };
        return .{
            .ptr = obj,
            .vtab = &.{ // @4/4
                .render = impl.render,
            },
        };
    }
};
