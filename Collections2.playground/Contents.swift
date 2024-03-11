import UIKit

// Set

var meyveler = Set<String>()

// Veri Ekleme

meyveler.insert("Elma")
meyveler.insert("Portakal")
meyveler.insert("Muz")

print(meyveler)

meyveler.insert("Çilek") //meyveler.insert("Elma") olursa ekleme yapmıyor

print(meyveler)

// Döngü

for meyve in meyveler {
    print("Sonuç 1 : \(meyve)")
}

for (indeks, meyve) in meyveler.enumerated() {
    print("\(indeks). -> \(meyve)")
}

print("Boyut: \(meyveler.count)")
print("Boş mu: \(meyveler.isEmpty)")

meyveler.remove("Elma")

print(meyveler)

meyveler.removeAll()

print(meyveler)

// Dictionary - HashMap - Map

var iller = [Int:String]()

// Veri Ekleme

iller[16] = "Bursa"
iller[34] = "İstanbul"

print(iller)

// Veri Okuma

print(iller[16]!)

// Veri Güncelleme

iller[16] = "Yeni Bursa"

print(iller)

// Döngü

for (anahtar, deger) in iller {
    print("\(anahtar) -> \(deger)")
}

// Silme

iller.removeValue(forKey: 16)

print(iller)
