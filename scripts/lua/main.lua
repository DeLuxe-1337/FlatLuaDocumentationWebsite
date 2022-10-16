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

doc.new_page("Getting started", function()
    doc.text("h1", "- Getting started -")

    doc.text("h4", "Run the following commands to get the project setup")
    doc.code("git clone https://github.com/DeLuxe-1337/flat.lua", {
        ["git "] = highlight_theme.func_name,
        ["clone"] = highlight_theme.light_red,
    })

    doc.newline()

    doc.code("cd flat.lua", {
        ["cd"] = highlight_theme.func_name,
        ["flat.lua"] = highlight_theme.light_red
    })

    doc.newline()

    doc.text("h4", "You've installed flat.lua!", true)
    doc.newline()
    doc.newline()
    doc.newline()
    doc.text("p", "Now that you've installed flat.lua, you can run it by opening index.html (webserver)", true)
    doc.newline()
    doc.text("p", "You can code sites in the scripts/lua", true)
    doc.newline()
    doc.text("p", "scripts/lua is where all your scripts will be", true)

    doc.newline()
    doc.newline()
    doc.newline()
    doc.newline()
    doc.text("p", "Check out the examples on github to learn flat a little bit more.", true)
end)

doc.new_page("Components", function()
    doc.text("h1", "- Components -", true)

    doc.text("h2", "You can create components:")
    doc.code("flat.component.new(name: string, component_content: function);", my_highlight)

    doc.text("h2", "You can use components you created:")
    doc.code("flat.component.create(name: string);", my_highlight)
end)

doc.new_page("Styler", function()
    doc.text("h1", "- Styler -", true)

    doc.text("h2", "You can create styles to use later:")
    doc.code("flat.styler.new(name: string, style_properties: table);", my_highlight)

    doc.text("h2", "You can apply styles:")
    doc.code("flat.styler.use(name: string, elm: !element);", my_highlight)
end)

doc.new_page("Events", function()
    doc.text("h1", "- Events -", true)

    doc.text("h2", "You can create events:")
    doc.code("element:event(event: string, on_event: function)", my_highlight)
end)

doc.new_page("Elements", function()
    doc.text("h1", "- Elements -", true)

    doc.text("h2", "You can create elements:")
    doc.code("flat.element.create(element_type: string, inner_html: any, starting_properties: table or optional)",
        my_highlight)
end)

doc.new_page("Example - Hello, world!", function()
    doc.link("Example of `Hello, world`","https://github.com/DeLuxe-1337/flat.lua/blob/master/sample_sites/hello_world.lua")
end)