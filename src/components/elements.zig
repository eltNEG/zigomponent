const Node = @import("../interfaces/node.zig").Node;
const Element = @import("./wrapper.zig").El;
const NodesToNode = @import("./wrapper.zig").NodesToNode;
const Childless = @import("./wrapper.zig").Childless;

pub fn Input(nodes: ?[]const Node) Node {
    return Childless("input", nodes);
}

pub fn A(nodes: ?[]const Node) Node {
    return Element("a", nodes);
}
pub fn Address(nodes: ?[]const Node) Node {
    return Element("address", nodes);
}

pub fn Article(nodes: ?[]const Node) Node {
    return Element("article", nodes);
}

pub fn Aside(nodes: ?[]const Node) Node {
    return Element("aside", nodes);
}

pub fn Audio(nodes: ?[]const Node) Node {
    return Element("audio", nodes);
}

pub fn Base(nodes: ?[]const Node) Node {
    return Element("base", nodes);
}

pub fn Body(nodes: ?[]const Node) Node {
    return Element("body", nodes);
}

pub fn Br(nodes: ?[]const Node) Node {
    return Element("br", nodes);
}

pub fn Button(nodes: ?[]const Node) Node {
    return Element("button", nodes);
}

pub fn Canvas(nodes: ?[]const Node) Node {
    return Element("canvas", nodes);
}

pub fn Data(nodes: ?[]const Node) Node {
    return Element("data", nodes);
}

pub fn DataList(nodes: ?[]const Node) Node {
    return Element("datalist", nodes);
}

pub fn Details(nodes: ?[]const Node) Node {
    return Element("details", nodes);
}

pub fn Dialog(nodes: ?[]const Node) Node {
    return Element("dialog", nodes);
}

pub fn Div(nodes: ?[]const Node) Node {
    return Element("div", nodes);
}

pub fn Dl(nodes: ?[]const Node) Node {
    return Element("dl", nodes);
}

pub fn Em(nodes: ?[]const Node) Node {
    return Element("em", nodes);
}

pub fn Fieldset(nodes: ?[]const Node) Node {
    return Element("fieldset", nodes);
}

pub fn Figcaption(nodes: ?[]const Node) Node {
    return Element("figcaption", nodes);
}

pub fn Figure(nodes: ?[]const Node) Node {
    return Element("figure", nodes);
}

pub fn Footer(nodes: ?[]const Node) Node {
    return Element("footer", nodes);
}

pub fn Form(nodes: ?[]const Node) Node {
    return Element("form", nodes);
}

pub fn Header(nodes: ?[]const Node) Node {
    return Element("header", nodes);
}

pub fn H1(nodes: ?[]const Node) Node {
    return Element("h1", nodes);
}

pub fn H2(nodes: ?[]const Node) Node {
    return Element("h2", nodes);
}

pub fn H3(nodes: ?[]const Node) Node {
    return Element("h3", nodes);
}

pub fn H4(nodes: ?[]const Node) Node {
    return Element("h4", nodes);
}

pub fn H5(nodes: ?[]const Node) Node {
    return Element("h5", nodes);
}

pub fn H6(nodes: ?[]const Node) Node {
    return Element("h6", nodes);
}

pub fn Hgroup(nodes: ?[]const Node) Node {
    return Element("hgroup", nodes);
}

pub fn Head(nodes: ?[]const Node) Node {
    return Element("head", nodes);
}

pub fn Html(nodes: ?[]const Node) Node {
    return Element("html", nodes);
}

pub fn ToNode(nodes: ?[]const Node) Node {
    return NodesToNode(nodes);
}

pub fn Raw(text: []const u8) Node {
    return Text(text);
}

pub fn I(nodes: ?[]const Node) Node {
    return Element("i", nodes);
}

pub fn Iframe(nodes: ?[]const Node) Node {
    return Element("iframe", nodes);
}

pub fn Img(nodes: ?[]const Node) Node {
    return Element("img", nodes);
}

pub fn LabElement(nodes: ?[]const Node) Node {
    return Element("label", nodes);
}

pub fn Li(nodes: ?[]const Node) Node {
    return Element("li", nodes);
}

pub fn Ol(nodes: ?[]const Node) Node {
    return Element("ol", nodes);
}

pub fn Ul(nodes: ?[]const Node) Node {
    return Element("ul", nodes);
}

pub fn Nav(nodes: ?[]const Node) Node {
    return Element("nav", nodes);
}

pub fn Section(nodes: ?[]const Node) Node {
    return Element("section", nodes);
}

pub fn Main(nodes: ?[]const Node) Node {
    return Element("main", nodes);
}

pub fn Meta(nodes: ?[]const Node) Node {
    return Childless("meta", nodes);
}

pub fn Menu(nodes: ?[]const Node) Node {
    return Element("menu", nodes);
}

pub fn Link(nodes: ?[]const Node) Node {
    return Childless("link", nodes);
}

pub fn Span(nodes: ?[]const Node) Node {
    return Element("span", nodes);
}

pub fn Text(text: []const u8) Node {
    return Node.text(text);
}

pub fn Title(nodes: ?[]const Node) Node {
    return Element("title", nodes);
}

pub fn Script(nodes: ?[]const Node) Node {
    return Element("script", nodes);
}

pub fn Pre(nodes: ?[]const Node) Node {
    return Element("pre", nodes);
}

pub fn Code(nodes: ?[]const Node) Node {
    return Element("code", nodes);
}

pub fn P(nodes: ?[]const Node) Node {
    return Element("p", nodes);
}
