local socket = require("socket")

Scanner = {}
Scanner.__index = Scanner -- Bu satır, "Scanner" tablosunu bir class gibi kullanmamızı sağlyıo
-- Constructor (Yeni bir tarayıcı oluştuyo)
function Scanner.new(ip, startPort, endPort)
    local self = setmetatable({}, Scanner)
    self.ip = ip
    self.startPort = startPort
    self.endPort = endPort
    self.sonuclar = {} -- Her tarayıcının kendi özel listesi
    return self
end

function Scanner:kaydet(dosya, port)
    local veri = "IP: " .. self.ip .. " Port: " .. port .. " Durum: Açık\n"
    dosya:write(veri)
    dosya:flush()
end

-- Tarama Metodwu
function Scanner:start()
    local dosya = io.open("Acik_portlar.txt", "w")
    for i = self.startPort, self.endPort do
        local client = socket.tcp()
        client:settimeout(0.05)
        if client:connect(self.ip, i) then
            print("[+] " .. i .. " OPEN")
            self:kaydet(dosya, i) -- Metod olarak çağırıyoruz
            client:close()
        end
    end
    dosya:close()
end

-- KULLANIM
local scan = Scanner.new("127.0.0.1", 1, 1024)
scan:start()
