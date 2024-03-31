//
//  ViewController.swift
//  Odev7ToDoApp
//
//  Created by Yasemin TOK on 31.03.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var notListesi = [ToDoList]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        _ = viewModel.notListesi.subscribe(onNext: { liste in
            self.notListesi = liste
            self.toDoTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.notlariYukle()
    }
}

extension Anasayfa: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.ara(aramaKelimesi: searchText)
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "notHucre") as! NotHucre
        
        hucre.notName.text = not.not_name
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let not = notListesi[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: not)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let not = sender as? ToDoList {
                let detayVC = segue.destination as! NotDetay
                detayVC.not = not
            }
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silmeIslemi = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            
            let not = self.notListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "Not silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "Vazgeç", style: .cancel)
            
            alert.addAction(iptalAction)
            
            let silAction = UIAlertAction(title: "Sil", style: .destructive) { action in
                self.viewModel.sil(not_id: not.not_id!)
            }
            alert.addAction(silAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silmeIslemi])
    }
}

