local socket = require("socket")
io.write("Adin ne? ")  -- print gibi ama alt satıra geçmez
local isim = io.read() -- Klavyeden veri bekler
print("Selam " .. isim)
