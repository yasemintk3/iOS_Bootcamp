import UIKit

var ogrenciAdi = "Ahmet"
var ogrenciYas = 18
var ogrenciBoy = 1.78
var ogrenciBasHarf = "A"
var ogrenciDevamEdiyorMu = true

print(ogrenciAdi)
print(ogrenciYas)
print(ogrenciBoy)
print(ogrenciBasHarf)
print(ogrenciDevamEdiyorMu)


var urun_id:Int = 3416
var urun_adi:String = "Macbook Pro"
var urun_adet:Int = 100
var urun_fiyat:Int = 34999
var urun_tedarikci:String =  "Apple"

print("Ürün id        : \(urun_id)")
print("Ürün adı       : \(urun_adi)")
print("Ürün adeti     : \(urun_adet)")
print("Ürün fiyatı    : \(urun_fiyat) ₺")
print("Ürün tedarikçi : \(urun_tedarikci)")

//Constant - Sabitler
//var - let

var sayi = 10
print(sayi)
sayi = 20
print(sayi)

let numara = 100
print(numara)
//numara = 200
//print(numara)

//Type Casting - Tür Dönüşümü
//Sayısaldan Sayısala

var i = 42
var d = 56.75

var sonuc1 = Double(i)
var sonuc2 = Int(d) //yuvarlamaz, .dan sonrasını siler

print(sonuc1)
print(sonuc2)

//Sayısaldan Metine

var sonuc3 = String(i) //arkaplanda "42" oldu yani metin
var sonuc4 = String(d) //arkaplanda "56.75" oldu yani metin

print(sonuc3)
print(sonuc4)

//Metinden Sayısala

var yazi = "34" //34'te  farklı durumlar olabilir o yüzden kontrol altına almak lazım yani if let lazım

if let sonuc5  = Int(yazi) { //doğru bir şekilde dönüşüm yapılırsa yani dönüşümün doğru olup olmadığı kontrol ediliyor
    print(sonuc5) //dönüşüm doğruysa yani dönüşüm yapılabiliyorsa ekrana yazılacak
} else {
    print("Dönüşüm hatası") //eğer stringte sorun varsa yani dönüştürülemiyorsa bu kısım çalışacak
}

