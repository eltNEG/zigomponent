const Node = @import("../interfaces/node.zig").Node;
const EL = @import("./element.zig").El;

pub fn A(nodes: ?[]Node) Node {
    return EL("a", nodes);
}
pub fn Address(nodes: ?[]Node) Node {
    return EL("address", nodes);
}

pub fn Area(nodes: ?[]Node) Node {
    return EL("area", nodes);
}

pub fn Article(nodes: ?[]Node) Node {
    return EL("article", nodes);
}

pub fn Aside(nodes: ?[]Node) Node {
    return EL("aside", nodes);
}

pub fn Audio(nodes: ?[]Node) Node {
    return EL("audio", nodes);
}

pub fn Base(nodes: ?[]Node) Node {
    return EL("base", nodes);
}

pub fn Body(nodes: ?[]Node) Node {
    return EL("body", nodes);
}

pub fn Br(nodes: ?[]Node) Node {
    return EL("br", nodes);
}

pub fn Button(nodes: ?[]Node) Node {
    return EL("button", nodes);
}

pub fn Canvas(nodes: ?[]Node) Node {
    return EL("canvas", nodes);
}

pub fn Data(nodes: ?[]Node) Node {
    return EL("data", nodes);
}

pub fn DataList(nodes: ?[]Node) Node {
    return EL("datalist", nodes);
}

pub fn Details(nodes: ?[]Node) Node {
    return EL("details", nodes);
}

pub fn Dialog(nodes: ?[]Node) Node {
    return EL("dialog", nodes);
}

pub fn Div(nodes: ?[]Node) Node {
    return EL("div", nodes);
}

pub fn Dl(nodes: ?[]Node) Node {
    return EL("dl", nodes);
}

pub fn Em(nodes: ?[]Node) Node {
    return EL("em", nodes);
}

pub fn Fieldset(nodes: ?[]Node) Node {
    return EL("fieldset", nodes);
}

pub fn Figcaption(nodes: ?[]Node) Node {
    return EL("figcaption", nodes);
}

pub fn Figure(nodes: ?[]Node) Node {
    return EL("figure", nodes);
}

pub fn Footer(nodes: ?[]Node) Node {
    return EL("footer", nodes);
}

pub fn Form(nodes: ?[]Node) Node {
    return EL("form", nodes);
}

pub fn Header(nodes: ?[]Node) Node {
    return EL("header", nodes);
}

pub fn H1(nodes: ?[]Node) Node {
    return EL("h1", nodes);
}

pub fn H2(nodes: ?[]Node) Node {
    return EL("h2", nodes);
}

pub fn H3(nodes: ?[]Node) Node {
    return EL("h3", nodes);
}

pub fn H4(nodes: ?[]Node) Node {
    return EL("h4", nodes);
}

pub fn H5(nodes: ?[]Node) Node {
    return EL("h5", nodes);
}

pub fn H6(nodes: ?[]Node) Node {
    return EL("h6", nodes);
}

pub fn Hgroup(nodes: ?[]Node) Node {
    return EL("hgroup", nodes);
}

pub fn Head(nodes: ?[]Node) Node {
    return EL("head", nodes);
}

pub fn Html(nodes: ?[]Node) Node {
    return EL("html", nodes);
}

pub fn I(nodes: ?[]Node) Node {
    return EL("i", nodes);
}

pub fn Iframe(nodes: ?[]Node) Node {
    return EL("iframe", nodes);
}

pub fn Img(nodes: ?[]Node) Node {
    return EL("img", nodes);
}

pub fn Input(nodes: ?[]Node) Node {
    return EL("input", nodes);
}

pub fn Label(nodes: ?[]Node) Node {
    return EL("label", nodes);
}

pub fn Li(nodes: ?[]Node) Node {
    return EL("li", nodes);
}

pub fn Ol(nodes: ?[]Node) Node {
    return EL("ol", nodes);
}

pub fn Ul(nodes: ?[]Node) Node {
    return EL("ul", nodes);
}

pub fn Nav(nodes: ?[]Node) Node {
    return EL("nav", nodes);
}

pub fn Section(nodes: ?[]Node) Node {
    return EL("section", nodes);
}

pub fn Main(nodes: ?[]Node) Node {
    return EL("main", nodes);
}

pub fn Span(nodes: ?[]Node) Node {
    return EL("span", nodes);
}

pub fn P(nodes: ?[]Node) Node {
    return EL("p", nodes);
}
