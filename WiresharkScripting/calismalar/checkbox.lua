local selected = 1

local win = TextWindow.new("Seçim")

local function update()
    win:clear()
    win:append("Seçili: " .. selected .. "\n\n")
    if selected == 1 then
        win:append("► Seçenek 1\n")
    else
        win:append("  Seçenek 1\n")
    end
    if selected == 2 then
        win:append("► Seçenek 2\n")
    else
        win:append("  Seçenek 2\n")
    end
    if selected == 3 then
        win:append("► Seçenek 3\n")
    else
        win:append("  Seçenek 3\n")
    end
end

win:add_button("Seçenek 1", function()
    selected = 1
    update()
end)
win:add_button("Seçenek 2", function()
    selected = 2
    update()
end)
win:add_button("Seçenek 3", function()
    selected = 3
    update()
end)

update()
