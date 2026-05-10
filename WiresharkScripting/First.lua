-- 1. Bir fonksiyon tanımlıyoruz (Butona basınca ne olacak?)
local function selam_ver()
    -- Wireshark'ta bir mesaj penceresi açar
    report_failure("Selam Safak993! Wireshark Lua dünyasına hoş geldin.")
end

-- 2. Bu fonksiyonu Wireshark menüsüne ekliyoruz
-- "Tools" (Araçlar) menüsünün altında "Safak993 Selam" butonu oluşacak
register_menu("Safak993 Selam", selam_ver, MENU_TOOLS_UNSORTED)

print("Safak993 Scripti Basariyla Yuklendi!")
