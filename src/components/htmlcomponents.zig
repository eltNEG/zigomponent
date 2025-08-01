const Node = @import("../interfaces/node.zig").Node;
const EL = @import("./element.zig").El;

pub fn A(nodes: ?[]const Node) Node {
    return EL("a", nodes);
}
pub fn Address(nodes: ?[]const Node) Node {
    return EL("address", nodes);
}

pub fn Article(nodes: ?[]const Node) Node {
    return EL("article", nodes);
}

pub fn Aside(nodes: ?[]const Node) Node {
    return EL("aside", nodes);
}

pub fn Audio(nodes: ?[]const Node) Node {
    return EL("audio", nodes);
}

pub fn Base(nodes: ?[]const Node) Node {
    return EL("base", nodes);
}

pub fn Body(nodes: ?[]const Node) Node {
    return EL("body", nodes);
}

pub fn Br(nodes: ?[]const Node) Node {
    return EL("br", nodes);
}

pub fn Button(nodes: ?[]const Node) Node {
    return EL("button", nodes);
}

pub fn Canvas(nodes: ?[]const Node) Node {
    return EL("canvas", nodes);
}

pub fn Data(nodes: ?[]const Node) Node {
    return EL("data", nodes);
}

pub fn DataList(nodes: ?[]const Node) Node {
    return EL("datalist", nodes);
}

pub fn Details(nodes: ?[]const Node) Node {
    return EL("details", nodes);
}

pub fn Dialog(nodes: ?[]const Node) Node {
    return EL("dialog", nodes);
}

pub fn Div(nodes: ?[]const Node) Node {
    return EL("div", nodes);
}

pub fn Dl(nodes: ?[]const Node) Node {
    return EL("dl", nodes);
}

pub fn Em(nodes: ?[]const Node) Node {
    return EL("em", nodes);
}

pub fn Fieldset(nodes: ?[]const Node) Node {
    return EL("fieldset", nodes);
}

pub fn Figcaption(nodes: ?[]const Node) Node {
    return EL("figcaption", nodes);
}

pub fn Figure(nodes: ?[]const Node) Node {
    return EL("figure", nodes);
}

pub fn Footer(nodes: ?[]const Node) Node {
    return EL("footer", nodes);
}

pub fn Form(nodes: ?[]const Node) Node {
    return EL("form", nodes);
}

pub fn Header(nodes: ?[]const Node) Node {
    return EL("header", nodes);
}

pub fn H1(nodes: ?[]const Node) Node {
    return EL("h1", nodes);
}

pub fn H2(nodes: ?[]const Node) Node {
    return EL("h2", nodes);
}

pub fn H3(nodes: ?[]const Node) Node {
    return EL("h3", nodes);
}

pub fn H4(nodes: ?[]const Node) Node {
    return EL("h4", nodes);
}

pub fn H5(nodes: ?[]const Node) Node {
    return EL("h5", nodes);
}

pub fn H6(nodes: ?[]const Node) Node {
    return EL("h6", nodes);
}

pub fn Hgroup(nodes: ?[]const Node) Node {
    return EL("hgroup", nodes);
}

pub fn Head(nodes: ?[]const Node) Node {
    return EL("head", nodes);
}

pub fn Html(nodes: ?[]const Node) Node {
    return EL("html", nodes);
}

pub fn I(nodes: ?[]const Node) Node {
    return EL("i", nodes);
}

pub fn Iframe(nodes: ?[]const Node) Node {
    return EL("iframe", nodes);
}

pub fn Img(nodes: ?[]const Node) Node {
    return EL("img", nodes);
}

pub fn Input(nodes: ?[]const Node) Node {
    return EL("input", nodes);
}

pub fn Label(nodes: ?[]const Node) Node {
    return EL("label", nodes);
}

pub fn Li(nodes: ?[]const Node) Node {
    return EL("li", nodes);
}

pub fn Ol(nodes: ?[]const Node) Node {
    return EL("ol", nodes);
}

pub fn Ul(nodes: ?[]const Node) Node {
    return EL("ul", nodes);
}

pub fn Nav(nodes: ?[]const Node) Node {
    return EL("nav", nodes);
}

pub fn Section(nodes: ?[]const Node) Node {
    return EL("section", nodes);
}

pub fn Main(nodes: ?[]const Node) Node {
    return EL("main", nodes);
}

pub fn Span(nodes: ?[]const Node) Node {
    return EL("span", nodes);
}

pub fn Text(text: []const u8) Node {
    return Node.text(text);
}

pub fn Title(nodes: ?[]const Node) Node {
    return EL("title", nodes);
}

pub fn Title2(text: []const u8) Node {
    return EL("title", &[_]Node{Text(text)[0..]});
}

pub fn P(nodes: ?[]const Node) Node {
    return EL("p", nodes);
}
