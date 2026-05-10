-- register_menu(isim, fonksiyon, menu_tipi)
register_menu("Safak993/Test Butonu", function()
    local win = TextWindow.new("Safak993 Log Ekranı") -- Ekran çıkarır
    win:set("Buraya istediğin uzunlukta\nçok satırlı yazılar\nekleyebilirsin.")
    win:append("\nBu da sonradan eklenen satır.")
end, MENU_TOOLS_UNSORTED)
