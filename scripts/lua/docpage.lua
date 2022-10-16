local flat = _G.flat
local module = {}

module.pages = {}

function module.create_pages()
    flat.component.new("docpage", function()
        local page_div = flat.element.create("div", nil)

        flat.styler.new("page", {
            position = "relative",
            color = "rgb(255, 255, 255)",
            width = "80%",
            display = "inline-block",
            text_align = "center",
            margin_left = "11%"
        })

        page_div:render()

        flat.styler.use("page", page_div)

        table.insert(module.pages, page_div)

        return {
            get = page_div
        }
    end)
end

function module.destroy_pages()
    for i, v in pairs(module.pages) do
        v:remove()
        table.remove(module.pages, i)
    end
end

module.div = nil

function module.new_page(name, func)
    flat.component.create("nav_option").bind(name, function(div)
        module.div = div
        func()
    end)
end

function module.text(size, text, center)
    center = center or false

    local text = flat.element.create(size, text)
    text:render()
    module.div:render_child(text)

    if center then
        text.style = "display: inline-block; user-select: none;"
    else 
        text.style = "user-select: none;"
    end
end

function module.code(code, highlightt)
    local c = flat.element.create("div", code)

    flat.styler.new("code-doc", {
        border = "0.375rem",
        position = "relative",
        padding = "1rem 1rem",
        margin_bottom = "10px",
        margin_top = "10px",
        color = "#dbdbdb",
        margin_left = "10px",
        background_color = "rgb(45, 45, 45)",
        border_radius = "0.375rem",
        width = "fit-content",
        display = "inline-block"
    })

    c:render()
    module.div:render_child(c)

    flat.styler.use("code-doc", c)

    for i,v in pairs(highlightt) do
        code = code:gsub(i, "<font " .. "color='" .. v .. "'>" .. i .. "</font>")
    end

    c.innerHTML = code
end

function module.link(text, url)
    local c = flat.element.create("a", text, {href = url})

    flat.styler.new("link-doc", {
        position = "relative",
        padding = "1rem 1rem",
        margin_bottom = "10px",
        margin_top = "10px",
        color = "#0377fc",
        margin_left = "10px",
        width = "fit-content",
        display = "inline-block"
    })

    c:render()
    module.div:render_child(c)

    flat.styler.use("link-doc", c)
end

function module.newline()
    local c = flat.element.create("div", nil)

    flat.styler.new("newline", {
        position = "relative",
        width = "100%",
        display = "inline-block"
    })

    c:render()
    module.div:render_child(c)

    flat.styler.use("newline", c)
end

return module
