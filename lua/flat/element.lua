local module = {}
local js = require "js"

module.page = nil

function get_element(id)
    return js.global.document:getElementById(id)
end

function get_id(number)
    return "flat_" .. number
end

function module.create(kinda, innera, props)
    local page = module.page
    local result = {
        properties = {
            flat_kind = kinda,
            innerHTML = innera
        },
        build = function(self)
            return "<" .. self.properties.flat_kind .. " id='" .. get_id(self.render_index or (#page.current_page_html + 1)) .. "'" .. ">" .. "</" ..
                       self.properties.flat_kind .. ">"
        end,
        render = function(self, build)
            build = build or self:build()

            if not self.render_index then
                self.render_index = page.render(build)
            end

            self:postrender(self.render_index)
        end,
        postrender = function(self, id)
            local elm = get_element(get_id(id))
            if elm then
                for i, v in pairs(self.properties) do
                    if elm[i] then
                        elm[i] = v
                    else
                        elm:setAttribute(i, v)
                    end
                end
            end

            page.current_page_html[self.render_index] = elm.outerHTML
        end,
        event = function(self, ev, fn)
            local elm = get_element(get_id(self.render_index))

            elm:addEventListener(ev, fn)
            
            return {
                kill = function()
                    elm:removeEventListener(ev, fn)
                end
            }
        end
    }

    if props then
        for i, v in pairs(props) do
            result.properties[i] = v
        end
    end

    return setmetatable(result, {
        __newindex = function(table, index, value)
            if index ~= "render_index" then
                rawset(table.properties, index, value)

                if table.render_index then
                    page.current_page_html[table.render_index] = table:build()
                    table:render()
                end
            else
                rawset(table, index, value)
            end
        end,
        __index = function(table, index)
            if not t and index ~= "render_index" then
                local elm = get_element(get_id(rawget(table, "render_index")))
                return elm[index] or elm:getAttribute(index)
            end

            return table.properties[index]
        end
    })
end

return module
