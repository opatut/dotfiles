--dotmeter conky by mrpeachy jan 2011
require 'cairo'

function dotchart(on, off,trx,try,rad,gap,num,text)
    dotcol={}
    for i=1,100 do
        dotcol[i]="off"
    end
    for i=1,tonumber(num) do
        dotcol[i]="on"
    end
    for i=0,9 do
        n=i
        for i=1,10 do
            if dotcol[(n*10)+i]=="on" then
                cairo_set_source_rgba(cr, on[1], on[2], on[3], on[4])
            else
                cairo_set_source_rgba(cr, off[1], off[2], off[3], off[4])
            end
            cairo_arc (cr,trx+((2*rad+gap)*i - gap),try+(2*rad+gap)*n,rad,0,math.pi*2)--the number after *n),rad, is radius size.
            --cairo_rectangle(cr, trx + (rad + gap) * (i - 1), try + (rad + gap) * n, rad, rad)
            cairo_fill (cr)
        end
    end
    --write text
    font="White Rabbit"
    fontsize=16
    cairo_select_font_face (cr, font, CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
    cairo_set_font_size (cr, fontsize);
    cairo_set_source_rgba(cr, on[1], on[2], on[3], on[4])
    cairo_move_to (cr,trx + 1,try - 5)
    --cairo_rotate (cr,math.pi*1.5)--controls text angle
    cairo_show_text (cr, text)
    cairo_stroke (cr)
    --cairo_rotate (cr,math.pi*1.5*-1)--controls entire line angle
end--function

function conky_draw_fig()
    if conky_window == nil then return end
    local cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
    cr = cairo_create(cs)
    local updates=tonumber(conky_parse('${updates}'))
    if updates>-1 then
        --#########################################################################################################
        --#########################################################################################################
        on = {1,1,1,1}
        off = {1,1,1,0.3}
        radius = 2
        gap = 2

        values = {}
        table.insert(values, {"CPU",  conky_parse("${cpu}")})
        table.insert(values, {"RAM",  conky_parse("${memperc}")})
        --table.insert(values, {"SWAP", conky_parse("${swapperc}")})
        table.insert(values, {"/ROOT", conky_parse("${fs_used_perc /}")})
        table.insert(values, {"/HOME", conky_parse("${fs_used_perc /home}")})
        --table.insert(values, {"DOWN", conky_parse("${downspeedf}")})
        --table.insert(values, {"UP",   conky_parse("${upspeedf}")})

        for k,v in pairs(values) do
            con = on
            --if v[1] == "CPU" then con = {0, 0.7, 0, 1} end
            --if v[1] == "RAM" then con = {0, 0.5, 0.5, 1} end
            --if v[1] == "SWAP" then con = {0.9, 0.9, 0, 1} end
            dotchart(con, off, 920 + 80 * (k - 1), 20, radius, gap, v[2], v[1])
        end
    end-- if updates>5
end-- end main function
