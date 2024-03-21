//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Yasemin TOK on 20.03.2024.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    
    var kisilerListesi = [Kisiler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self // yukarıda tanımla olan searchBar'ın delegate özelliğine UISearchBarDelegate özelliklerini aktardık yani aşağıdaki delegate özelliği  artık tanımladığımız searchBar'a ait oldu. burdaki self Anasayfa'yı yani SearchBarDelegate'i temsil ediyor.
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahu", kisi_tel: "555555")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Buse", kisi_tel: "666666")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Caner", kisi_tel: "777777")
        
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü.")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let kisi = sender as? Kisiler {
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi // ilk kisi detay sayfasındaki oluşturulmuş olan ikincisi ise yukarıda
            }
        }
    }
}

extension Anasayfa : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { // yukarıda self diyerek bu özelliği, tanımladığımız searchBar'a aktardık
        print("Kişi Ara : \(searchText)")
    }
}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kisi = kisilerListesi[indexPath.row] // her bir hücre için
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: kisi) //buradan yukarıdaki prepare funca gidiyor
        
        tableView.deselectRow(at: indexPath, animated: true) // detay sayfasından geri gelince hücre seçili olmuyor
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
    
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "İptal", style: .destructive) { action in
                print("Kişi Sil : \(kisi.kisi_id!)")
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

