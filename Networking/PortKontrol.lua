local socket = require('socket')  -- soket kütüphanesi
local function Tara(ip, port)
    local baglanti = socket.tcp() -- tcp bağlantısı atmak icin bir değişken
    local sonuc = baglanti:connect(ip, port)
    if sonuc then                 --  herhangibibirşey döndürürse
        print("[+] Port " .. port .. " ACIK! 🔓")
    else
        print("[-] Port " .. port .. " kapali. 🔒")
    end
end
local hedef_ip = "127.0.0.1" -- bilgisayar
local hedef_port = 80        -- http portu
Tara(hedef_ip, hedef_port)
