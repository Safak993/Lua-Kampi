local socket = require("socket")
print("6 saniye beklicez")
io.stdout:setvbuf("no") -- Tamponlamayı tamamen kapatır
for i = 1, 6 do
    print(i)
    socket.sleep(1)
end
print("Tam tamına " .. 6 .. " Saniye bekledin!")
