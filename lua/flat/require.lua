local js = require "js"
local window = js.global

local flat = {
    element = require"lua.flat.element",
    page = require"lua.flat.page",
    router = require"lua.flat.router",
    styler = require"lua.flat.styler",
    component = require"lua.flat.component",
    init = function()
        function wait(delay)
            local co = assert(coroutine.running(), "Should be run in a coroutine")
        
            window:setTimeout(function()
                assert(coroutine.resume(co))
            end, delay*1000)
        
            coroutine.yield()
        end
    end
}

_G.flat = flat

return flat