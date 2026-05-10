local socket = require("socket")
io.stdout:setvbuf("no") -- Rakamların anlık düşmesi için şart

-- 1. Kullanıcıdan isim al
io.write("Adin ne canavarrr? ")
local isim = io.read()

-- 2. Kullanıcıdan saniye al
io.write("Kac saniye geri sayalim? ")
local saniye_input = io.read()
local saniye = tonumber(saniye_input)

-- 3. Kontrol ve Geri Sayım
if saniye then
    print("\nSistem baslatiliyor, kemerleri bagla " .. isim .. "!")

    -- BURAYA ÖYLE BİR FOR DÖNGÜSÜ YAZ Kİ:
    -- saniye değişkeninden başlayıp 1'e kadar geri gitsin.
    -- Her adımda 1 saniye beklesin.
    print(saniye .. "Sayisindan geri sayim basladi!!!!!!")
    for i = saniye, 1, -1 do
        print("Geri sayim: " .. i)
        socket.sleep(1)
    end



    print("\nBOOOM! Sure bitti. Gule gule " .. isim)
else
    print("Lan dogru durust sayi girsene!")
end
