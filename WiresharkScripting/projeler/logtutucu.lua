local my_info = {
    version = "1.0.1",
    author = "Safak993",
    repository = "https://github.com/Safak993/Lua-Kampi/"
}
set_plugin_info(my_info)
register_menu("Logtutucu", function()
    local win = TextWindow.new("Log")
    local sayac = {}

    local listener = Listener.new(nil, nil)

    local function ekrani_guncelle()
        win:clear()
        win:append(string.format("%-45s %s\n", "Gelen Paket", "Grafik"))
        win:append(string.rep("-", 75) .. "\n")

        for ip, adet in pairs(sayac) do
            if ip:match("%d+%.%d+%.%d+%.%d+") then
                --"%-45s"   string yaz, 45 karakter yer kapla, sola yasla (- işareti sola yaslar)
                --"%s"      normal string yaz
                -- böylece hepsi hizalı görünür
                local bilgi = string.format("%s (paket sayisi: %d)", ip, adet)
                local grafik = string.rep("#", math.floor(adet / 100))
                if grafik == "" then grafik = "-" end
                win:append(string.format("%-45s %s\n", bilgi, grafik))
            end
        end
    end

    function listener.packet(pinfo, tvb, tapinfo)
        local src = tostring(pinfo.src)
        sayac[src] = (sayac[src] or 0) + 1
        ekrani_guncelle()
    end

    win:set_atclose(function()
        listener:remove()
    end)
end, MENU_TOOLS_UNSORTED)
--Safak993
