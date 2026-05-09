local envanter = { "Klavye", "Mouse" }
-- Tabloya eleman ekle
table.insert(envanter, "Monitor")
-- Tabloyu gez (ipairs: index-pairs demektir, diziler için kullanılır)
for sira, esya in ipairs(envanter) do
    print(sira .. ". siradaki esya: " .. esya)
end
-- Sözlük gibi kullan
local pc = { cpu = "i7", ram = "16GB" }
print("RAM kapasitesi: " .. pc["ram"])
