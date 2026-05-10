local dosya = io.open("sozluk.txt", "r")
sozluk = {
    { terim = "sqli", aciklama = "Veri tabani enjeksiyonu" }
    , { terim = "xss", aciklama = "Script enjeksiyonu" }
}
local function yukle()
    local dosya = io.open("sozluk.txt", "r")
    if not dosya then return {} end
    local t = {}
    for satir in dosya:lines() do
        -- Stringi ":" işaretinden ikiye ayırıp tabloya sokuyoruz
        local terim, aciklama = satir:match("([^:]+):(.+)") -- : dışındaki herşeyi bul
        if terim and aciklama then
            table.insert(t, { terim = terim, aciklama = aciklama })
        end
    end
    dosya:close()
    return t
end
local function kaydet()
    local dosya = io.open("sozluk.txt", "w")
    for _, veri in ipairs(sozluk) do
        -- Tabloyu "Terim:Aciklama" formatında stringe çeviriyoruz
        dosya:write(veri.terim .. ":" .. veri.aciklama .. "\n")
    end
    dosya:close()
end
kaydet()
yukle()
io.write("Hosgeldiniz, Bir terim aramak icin isminizi giriniz\n(Kullanici):-> ")
isim = io.read()
local function arama()
    io.write("Aramak istediginiz terimi yaziniz...\n(" .. isim .. "):-> ")
    local terim = io.read():lower()
    local bulundu = false
    for _, veri in ipairs(sozluk) do
        if veri.terim == terim then
            print("Terim bulundu!: " .. veri.terim .. "\nAciklama: " .. veri.aciklama .. "\n\n\n")
            bulundu = true

            arama()
            return
        end
    end
    if not bulundu then
        print("Boyle bir terim bulunamadi " .. isim .. "\n\n\n\n")
        io.write("Eklemek icin (y), tekrar aramak icin (a), cikmak icin (n) giriniz.\n(" .. isim .. "):-> ")
        local secim = io.read():lower()
        if secim == "y" then
            local yaz_mod = io.open("sozluk.txt", "a")
            io.write("Ekleyeceginiz terim: ")
            local eklenecek_terim = io.read():lower()
            io.write("Aciklamasi: ")
            local eklenecek_ac = io.read():lower()

            table.insert(sozluk, { terim = eklenecek_terim, aciklama = eklenecek_ac })
            print(eklenecek_terim .. " eklendi!\n")
            kaydet()
            arama()
        elseif secim == "a" then
            arama()
        else
            print("Gorusmek uzere " .. isim)
        end
    end
end
arama()
