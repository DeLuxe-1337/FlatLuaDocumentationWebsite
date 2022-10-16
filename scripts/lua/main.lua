local flat = require "flat.require"
flat.page.load_dom("flat-dom") -- loads the custom dom from render/index.html

require"scripts.lua.navigation".initialize()
local doc = require "scripts.lua.docpage"

local highlight_theme = {
    func_name = "#4684f0",
    light_red = "#f04668"
}

local my_highlight = {
    ["flat"] = "#696969",
    ["new"] = highlight_theme.func_name,
    ["create"] = highlight_theme.func_name,
    ["use"] = highlight_theme.func_name,
    ["print"] = highlight_theme.func_name,
    ["string"] = highlight_theme.light_red,
    ["end"] = highlight_theme.light_red,
    ["function"] = "orange",
    ["!element"] = "#ddf21d",
    ["element:"] = "#ddf21d",
    ["table"] = "#dd1df2",
    ["any"] = "#605cdb",
    ["optional"] = "#00ebd7"
}

flat.component.create("nav_option").bind("Components", function(div)
    doc.text("h1", "- Components -", div, true)

    doc.text("h2", "You can create components:", div)
    doc.code("flat.component.new(name: string, component_content: function);", my_highlight, div)

    doc.text("h2", "You can use components you created:", div)
    doc.code("flat.component.create(name: string);", my_highlight, div)
end)

flat.component.create("nav_option").bind("Styler", function(div)
    doc.text("h1", "- Styler -", div, true)

    doc.text("h2", "You can create styles to use later:", div)
    doc.code("flat.styler.new(name: string, style_properties: table);", my_highlight, div)

    doc.text("h2", "You can apply styles:", div)
    doc.code("flat.styler.use(name: string, elm: !element);", my_highlight, div)
end)

flat.component.create("nav_option").bind("Events", function(div)
    doc.text("h1", "- Events -", div, true)

    doc.text("h2", "You can create events:", div)
    doc.code("element:event(event: string, on_event: function)", my_highlight, div)
end)

flat.component.create("nav_option").bind("Elements", function(div)
    doc.text("h1", "- Elements -", div, true)

    doc.text("h2", "You can create elements:", div)
    doc.code("flat.element.create(element_type: string, inner_html: any, starting_properties: table or optional)",
        my_highlight, div)
end)

flat.component.create("nav_option").bind("Example - Hello, world!", function(div)
    doc.link("Example of `Hello, world`","https://github.com/DeLuxe-1337/flat.lua/blob/master/sample_sites/hello_world.lua", div)
end)