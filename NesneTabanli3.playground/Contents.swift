import UIKit

// Inheritance

class Ev {
    var pencereSayisi:Int?
    
    init(pencereSayisi:Int) {
        self.pencereSayisi = pencereSayisi
    }
}

class Saray : Ev {
    var kuleSayisi:Int?
    
    init(kuleSayisi:Int, pencereSayisi:Int) {
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}

class Villa : Ev {
    var garajVarMi:Bool?
    
    init(garajVarMi:Bool, pencereSayisi:Int) {
        self.garajVarMi = garajVarMi
        super.init(pencereSayisi: pencereSayisi)
    }
}

let topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)
let bogazVilla = Villa(garajVarMi: true, pencereSayisi: 30)

print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)

print(bogazVilla.garajVarMi!)
print(bogazVilla.pencereSayisi!)

// Override

class Hayvan {
    func sesCikar() {
        print("Sesi yok")
    }
}

class Memeli: Hayvan{
   // burada bir şey olmasa da üst sınıftan aldığı işler ve func alt sınıflara iletilir.
}

class Kedi: Memeli {
    override func sesCikar() {
        print("Miyav Miyav")
    }
}

class Kopek: Memeli {
    override func sesCikar() {
        print("Hav Hav")
    }
}

let hayvan = Hayvan()
let memeli = Memeli()
let kedi = Kedi()
let kopek = Kopek()

hayvan.sesCikar()
memeli.sesCikar()
kedi.sesCikar()
kopek.sesCikar()

// Tip Dönüşümü - Upcasting | Downcasting

// Upcasting

var ev = Saray(kuleSayisi: 3, pencereSayisi: 10) as Ev

// Downcasting

var saray = Ev(pencereSayisi: 6) as? Saray

// Tip Kontrolü

if ev is Ev {
    print("Nesne Ev sınıfındandır")
} else {
    print("Nesne Ev sınıfından değildir.")
}

// Protocol - Interface

protocol MyProtocol {
    var degisken: Int {get set} // get buna değer atayabiliriz, set bundan değer okuyabiliriz
    
    func metod1()
    func metod2() -> String
}

class ClassA : MyProtocol{
    var degisken: Int = 10
    
    func metod1() {
        print("Metod 1 çalıştı")
    }
    
    func metod2() -> String {
        return "Metod 2 çalıştı"
    }
}

var a = ClassA()

print(a.degisken)

a.metod1()

print(a.metod2())

// Extension - Genişletme

extension Int {
    func carpma(sayi:Int) -> Int {
        return self * sayi // self genişletmek istediğimiz classı yani Int classını temsil ediyor. sayi ise gelen veri
    }
}

let x = 3.carpma(sayi: 5)
print(x)

// Closure

let ifade = {
    print("Merhaba")
}

ifade()
