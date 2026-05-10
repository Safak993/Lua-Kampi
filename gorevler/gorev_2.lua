local dosya_adi = "gecmis.txt"
local socket = require("socket")
io.stdout:setvbuf("no")
-- Verileri okuma denemesi
local dosya = io.open(dosya_adi, "r")
local eski_isim, eski_zaman, eski_saniye = nil, nil, nil

if dosya then
    local satirlar = {}
    for satir in dosya:lines() do
        table.insert(satirlar, satir)
    end
    dosya:close()

    -- Dosya formatımız: 1. satır isim, 2. satır zaman, 3. satır saniye olsun
    if #satirlar >= 3 then
        eski_isim = satirlar[1]
        eski_zaman = satirlar[2]
        eski_saniye = satirlar[3]
    end
end

if not eski_isim then
    -- kayit ve oyün
    io.write("Hosgeldiniz. Isminiz nedir?\n(Kullanici) :-> ")
    local isim = io.read()

    io.write("Kac saniyeden geri sayalim?\n(" .. isim .. ") :-> ")
    local saniye = tonumber(io.read()) or 10 -- Sayı girilmezse varsayılan 10

    -- Geri sayım döngüsü
    print("\nGeri sayim basliyor...")
    for i = saniye, 0, -1 do
        print(i .. "...")
        socket.sleep(1)
    end

    -- Verileri kaydet
    local yaz_dosya = io.open(dosya_adi, "w")
    if yaz_dosya then
        local simdiki_zaman = os.date("%d/%m/%Y %H:%M:%S")
        yaz_dosya:write(isim .. "\n" .. simdiki_zaman .. "\n" .. saniye)
        yaz_dosya:close()
        print("\nGecmisiniz kaydedildi, " .. isim .. "!")
    end
else
    print("Tekrardan hosgeldin " .. eski_isim .. "!")
    print("En son " .. eski_zaman .. " tarihinde " .. eski_saniye .. " saniye geri saymistik.")
end
