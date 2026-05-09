local oyuncu = {
    ad = "Şafak",
    yas = "13",
    diller = { "Python", "C", "Lua", "C++", "Java", "C#", "Vbs" }
}
print(oyuncu.ad)
print(oyuncu.diller[1])                     -- (Python) Çünkü lua diğer dillerden bağımsız 0indexinden değil 1 indexinden başlar
print(oyuncu.diller[1] .. oyuncu.diller[2]) -- lua dilinde  birleştirme + değilde .. ile olur
