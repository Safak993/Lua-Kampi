local function paket_izleyici()
    local win = TextWindow.new("Canlı Paket Logu")
    win:set("İzleme başlatıldı. Paketler bekleniyor... \n" .. string.rep("-", 30))
    -- Listener
    local listener = Listener.new(nil, "tcp")
    -- Her paket geldiğinde çalışıcak bu fonksiyon
    function listener.packet(pinfo, tvb, tapinfo)
        local zaman = tostring(pinfo.rel_ts) -- Paketin geliş zamanı
        local src = tostring(pinfo.src)      -- Kaynak IP
        local dst = tostring(pinfo.dst)      -- Hedef IP
        local len = pinfo.len                -- Paket boyutu

        local log = string.format("[%s] %s -> %s | Boyut: %d bytes\n", zaman, src, dst, len)
        -- Pencereye ekliyoz
        win:append(tostring(log))
    end

    -- 4. Pencere kapandığında dinleyiciyi durdur (Belleği koruma amaçlıdır)
    win:set_atclose(function()
        listener:remove()
    end)
end
register_menu("Canli Akis", paket_izleyici, MENU_TOOLS_UNSORTED)
