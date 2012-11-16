--dotmeter conky by mrpeachy jan 2011
require 'cairo'
require 'perlin'

size = 80
delta = 0.05
delta = 0.1
res = {1366, 786}
border = 3
s = 7

function conky_draw_fig()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)

    updates = tonumber(conky_parse('${updates}'))

    w = (res[1]-2*border)/(size*(delta + 1)) + 1
    h = (res[2]-2*border)/(size*(delta + 1)) + 1

    if updates > -1 then
        for x=1,w do
            for y=1,h do
                -- local a = 0.5 - (math.sin(updates * 0.1 - x * 2) * 0.2 + math.cos(y * 1000) - math.sin(12 + updates * 0.04 - y * 0.2) ) * 0.5
                local a = noise(x * 1.0 / w * s, y * 1.0 / h * s, updates * 0.1)
                cairo_set_source_rgba(cr, 1, 1, 1, a) -- a > 0.4 and (a > 0.5 and 1 or 0.5) or 0)
                local sx = size
                cairo_rectangle(cr, border + size * (delta + 1) * x - sx / 2, border + size * (delta + 1) * y - sx / 2, sx, sx)
                cairo_fill(cr)
            end
        end
    end
end
