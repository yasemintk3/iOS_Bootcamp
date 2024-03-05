import UIKit

// Opsional Kavramı
// Tanımlama

var mesaj = "Merhaba"

var str:String? // eğer değer aktarmayacaksak yani başlangıçta boş olacaksa bu şekilde tanımlanır "= nil" de denebilir

str = "Merhaba"

if str != nil {
    print(str!) // unwrap
} else {
    print("str nil değer içeriyor")
}

// Optional Binding

if let temp = str { // str'de değer varsa ve temp'e aktarılabiliyorsa bu kısım çalışacaktır.
    print(temp) // otomatik unwrap oldu çünkü üstte kontrol yapıldı
} else {
    print("str nil değer içeriyor")
}

if var temp = str {
    print(temp)
    temp = "Nasılsın"  // sonradan değişkene değer atamak için var ile yapılabilir.
    print(temp)
} else {
    print("str nil değer içeriyor")
}

