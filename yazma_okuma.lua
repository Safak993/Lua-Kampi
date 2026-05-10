-- w yazma modu (sıfırlar) a append(üstüne yazar)
local dosya = io.open("log.txt", "a")

if dosya then     --dosya boş ise
    dosya:write("Sistem basladi: " .. os.date() .. "\n")
    dosya:close() -- dosyayı kapatmazsak veri yazılmaz
    print("Log kaydedildi.")
else
    print("Dosya acilamadi!")
end
