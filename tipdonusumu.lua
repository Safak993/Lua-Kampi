local socket = require("socket")

-- 1. Tamponlamayı kapat (Terminalin anlık tepki vermesi için şart)
io.stdout:setvbuf("no")

io.write("Adin ne? ")
-- 2. Çıktıyı zorla gönder (Bazı sistemlerde io.write sonrası gerekebilir)
io.flush()

local isim = io.read()

-- Eğer isim boşsa veya geçersizse kontrolü
if isim and isim ~= "" then -- ~= pythondaki
    print("Selam " .. isim)
else
    print("Bir isim girmedin!")
end
