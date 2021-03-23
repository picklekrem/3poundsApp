//
//  AlbumViewController.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import UIKit

class AlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var tableView: UITableView!
    private var albumListViewModel : AlbumListViewModel!
    
    var chosenPageId = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Albums"
        let nib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AlbumTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.separatorStyle = .none
        
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        Webservice().albumDataFetch(url: url) { (albumList) in
            if let albumList = albumList{
//                print(albumList)
                self.albumListViewModel = AlbumListViewModel(albumList: albumList)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumListViewModel == nil ? 0 : self.albumListViewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumViewModel = self.albumListViewModel.albumAtIndex(indexPath.row)
        chosenPageId = albumViewModel.id
        
        performSegue(withIdentifier: "detailVC", sender: nil)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVC" {
            let destination = segue.destination as! DetailsViewController
            destination.selectedPageId = chosenPageId
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumTableViewCell", for: indexPath) as! AlbumTableViewCell

        let albumViewModel = self.albumListViewModel.albumAtIndex(indexPath.row)
        cell.titleLabel.text = albumViewModel.title
        cell.idLabel.text = "id:\(albumViewModel.id)"

        return cell
    }
    

   

}
