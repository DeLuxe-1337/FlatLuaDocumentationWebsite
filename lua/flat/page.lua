local js = require "js"
local http = require "lua.flat.http"

local module = {}
module.current_page_html = {}
module.dom = nil

function GetHtml()
    local build = ""

    for i, v in pairs(module.current_page_html) do
        build = build .. v .. "\n"
    end

    return build
end

function module.render(element)
    if element then
        table.insert(module.current_page_html, element)
    end

    module.dom.innerHTML = GetHtml()

    return #module.current_page_html
end

function module.load_dom(dom)
    _G.flat.init()
    _G.flat.element.page = module

    local index = http.get("render/index.html")

    js.global.document:write(index)
    js.global.document:close()

    module.dom = js.global.document:getElementById(dom)
end

return module
