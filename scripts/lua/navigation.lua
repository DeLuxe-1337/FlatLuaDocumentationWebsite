local flat = _G.flat
local module = {}

module.pages = require("scripts.lua.docpage")

function module.create_navigation()
    module.leftnav = flat.element.create("div", nil)

    flat.styler.new("leftnav", {
        overflow_x = "hidden",
        position = "fixed",
        width = "20%",
        height = "100%",
        background_color = "rgb(45, 45, 45)",
        border = "none",
        text_align = "center"
    })

    module.leftnav:render()

    flat.styler.use("leftnav", module.leftnav)
end

function module.init_nav_option()
    flat.component.new("nav_option", function()
        local div = flat.element.create("div", "This is a nav option!")
    
        flat.styler.new("navopt", {
            position = "relative",
            color = "rgb(255, 255, 255)",
            width = "100%",
            display = "inline-block",
            user_select = "none",
            margin_bottom = "1%"
        })
    
        div:render()
        module.leftnav:render_child(div)
    
        flat.styler.use("navopt", div)
    
        return {
            bind = function(update, fn)
                div.innerHTML = update
    
                div:event("click", function()
                    module.pages.destroy_pages()
                    local page = flat.component.create("docpage")
                    fn(page.get)
                end)
            end
        }
    end)
end

function module.initialize()
    module.create_navigation()
    module.init_nav_option()
    module.pages.create_pages()
end

return module
