const Node = @import("../interfaces/node.zig").Node;
const Attr = @import("./wrapper.zig").Attr;

pub fn Async() Node {
    return Attr("async", null);
}

pub fn AutoFocus() Node {
    return Attr("autofocus", null);
}

pub fn AutoPlay() Node {
    return Attr("autoplay", null);
}

pub fn Checked() Node {
    return Attr("checked", null);
}

pub fn Controls() Node {
    return Attr("controls", null);
}

pub fn CrossOrigin() Node {
    return Attr("crossorigin", null);
}

pub fn DateTime(value: []const u8) Node {
    return Attr("datetime", value);
}

pub fn Defer() Node {
    return Attr("defer", null);
}

pub fn Disabled() Node {
    return Attr("disabled", null);
}

pub fn Draggable(value: []const u8) Node {
    return Attr("draggable", value);
}

pub fn OnClick(value: []const u8) Node {
    return Attr("onclick", value);
}

// pub fn DragDrop() Node {
//     return Attr("draggable", null);
// }

pub fn Loop() Node {
    return Attr("loop", null);
}

pub fn Multiple() Node {
    return Attr("multiple", null);
}

pub fn Muted() Node {
    return Attr("muted", null);
}

pub fn PlaysInline() Node {
    return Attr("playsinline", null);
}

pub fn ReadOnly() Node {
    return Attr("readonly", null);
}

pub fn Required() Node {
    return Attr("required", null);
}

pub fn Selected() Node {
    return Attr("selected", null);
}

pub fn Accept() Node {
    return Attr("accept", null);
}

pub fn Action() Node {
    return Attr("action", null);
}

pub fn Alt() Node {
    return Attr("alt", null);
}

pub fn Aria(comptime name: []const u8, value: []const u8) Node {
    return Attr("aria-" ++ name, value);
}

pub fn As(value: []const u8) Node {
    return Attr("as", value);
}

pub fn AutoComplete(value: []const u8) Node {
    return Attr("autocomplete", value);
}

pub fn Charset(value: []const u8) Node {
    return Attr("charset", value);
}

pub fn CiteAttr(value: []const u8) Node {
    return Attr("cite", value);
}

pub fn Class(value: []const u8) Node {
    return Attr("class", value);
}

pub fn Cols(value: []const u8) Node {
    return Attr("cols", value);
}

pub fn ColSpan(value: []const u8) Node {
    return Attr("colspan", value);
}

pub fn Content(value: []const u8) Node {
    return Attr("content", value);
}

pub fn Data(comptime name: []const u8, value: []const u8) Node {
    return Attr("data-" ++ name, value);
}

pub fn DataAttr(comptime name: []const u8, value: []const u8) Node {
    return Attr("data-" ++ name, value);
}

pub fn SlotAttr(value: []const u8) Node {
    return Attr("slot", value);
}

pub fn For(value: []const u8) Node {
    return Attr("for", value);
}

pub fn FormAttr(value: []const u8) Node {
    return Attr("form", value);
}

pub fn Height(value: []const u8) Node {
    return Attr("height", value);
}

pub fn Hidden(value: []const u8) Node {
    return Attr("hidden", value);
}

pub fn Href(value: []const u8) Node {
    return Attr("href", value);
}

pub fn Sizes(value: []const u8) Node {
    return Attr("sizes", value);
}

pub fn ID(value: []const u8) Node {
    return Attr("id", value);
}

pub fn Integrity(value: []const u8) Node {
    return Attr("integrity", value);
}

pub fn LabelAttr(value: []const u8) Node {
    return Attr("label", value);
}

pub fn Lang(value: []const u8) Node {
    return Attr("lang", value);
}

pub fn List(value: []const u8) Node {
    return Attr("list", value);
}

pub fn Loading(value: []const u8) Node {
    return Attr("loading", value);
}

pub fn Max(value: []const u8) Node {
    return Attr("max", value);
}

pub fn MaxLength(value: []const u8) Node {
    return Attr("maxlength", value);
}

pub fn Method(value: []const u8) Node {
    return Attr("method", value);
}

pub fn Min(value: []const u8) Node {
    return Attr("min", value);
}

pub fn MinLength(value: []const u8) Node {
    return Attr("minlength", value);
}

pub fn Name(value: []const u8) Node {
    return Attr("name", value);
}

pub fn Pattern(value: []const u8) Node {
    return Attr("pattern", value);
}

pub fn Placeholder(value: []const u8) Node {
    return Attr("placeholder", value);
}

pub fn Popover(value: []const u8) Node {
    return Attr("popover", value);
}

pub fn PopoverTarget(value: []const u8) Node {
    return Attr("popovertarget", value);
}

pub fn PopoverTargetAction(value: []const u8) Node {
    return Attr("popovertargetaction", value);
}

pub fn Poster(value: []const u8) Node {
    return Attr("poster", value);
}

pub fn Preload(value: []const u8) Node {
    return Attr("preload", value);
}

pub fn Rel(value: []const u8) Node {
    return Attr("rel", value);
}

pub fn Role(value: []const u8) Node {
    return Attr("role", value);
}

pub fn Rows(value: []const u8) Node {
    return Attr("rows", value);
}

pub fn RowSpan(value: []const u8) Node {
    return Attr("rowspan", value);
}

pub fn Src(value: []const u8) Node {
    return Attr("src", value);
}

pub fn SrcSet(value: []const u8) Node {
    return Attr("srcset", value);
}

pub fn Step(value: []const u8) Node {
    return Attr("step", value);
}

pub fn Style(value: []const u8) Node {
    return Attr("style", value);
}

pub fn StyleAttr(value: []const u8) Node {
    return Attr("style", value);
}

pub fn TabIndex(value: []const u8) Node {
    return Attr("tabindex", value);
}

pub fn Target(value: []const u8) Node {
    return Attr("target", value);
}

pub fn Title(value: []const u8) Node {
    return Attr("title", value);
}

pub fn TitleAttr(value: []const u8) Node {
    return Attr("title", value);
}

pub fn Type(value: []const u8) Node {
    return Attr("type", value);
}

pub fn Value(value: []const u8) Node {
    return Attr("value", value);
}

pub fn Width(value: []const u8) Node {
    return Attr("width", value);
}

pub fn EncType(value: []const u8) Node {
    return Attr("enctype", value);
}

pub fn Dir(value: []const u8) Node {
    return Attr("dir", value);
}
