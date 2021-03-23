//
//  DetailsViewController.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import UIKit
import SDWebImage
class DetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var photoListViewModel : PhotoListViewModel!
    private var commentListViewModel : CommentListViewModel!
    
    var selectedPageId = Int()
    
    var chosenAlbumId = ""
    var chosenTitleLabel = ""
    var chosenImageView = ""
    var chosenId = ""
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var detailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Album \(selectedPageId)"
        let commentUrl = URL(string: "https://jsonplaceholder.typicode.com/comments?postId=\(selectedPageId)")!
        
        let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
        detailsTableView.register(nib, forCellReuseIdentifier: "DetailsTableViewCell")
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        
        Webservice().commentDataFetch(url: commentUrl, postId: selectedPageId) { (commentList) in
            if let commentList = commentList{
                print(commentList)
                
                self.commentListViewModel = CommentListViewModel(commentList: commentList)
                DispatchQueue.main.async {
                    self.detailsTableView.reloadData()
                }
            }
        }
        let photoUrl = URL(string: "https://jsonplaceholder.typicode.com/photos?albumId=\(selectedPageId)")!
        Webservice().photoDataFetch(url: photoUrl, albumId: selectedPageId) { (photoList) in
            if let photoList = photoList{
                print(photoList)
                
                self.photoListViewModel = PhotoListViewModel(photoList: photoList)
                
                DispatchQueue.main.async {
                    self.detailsTableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoViewModel = self.photoListViewModel.photoAtIndex(indexPath.row)
        chosenAlbumId = "\(photoViewModel.albumId)"
        chosenId = "\(photoViewModel.id)"
        chosenTitleLabel = photoViewModel.title
        chosenImageView = photoViewModel.url
        performSegue(withIdentifier: "popUpVc", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popUpVc"{
            let destination = segue.destination as! PopUpViewController
            destination.selectedPopUpAlbumId = chosenAlbumId
            destination.selectedPopUpId = chosenId
            destination.selectedPopUpTitleLabel = chosenTitleLabel
            destination.selectedPopUpImage = chosenImageView
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 0
        switch (mySegmentControl.selectedSegmentIndex) {
        case 0:
            returnValue = self.photoListViewModel == nil ? 0 : self.photoListViewModel.numberOfSection()
            break
        case 1:
            returnValue = self.commentListViewModel == nil ? 0 : self.commentListViewModel.numberOfSection()
            break
        default:
            break
        }
        
        return returnValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailsTableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as! DetailsTableViewCell
        let photoViewModel = self.photoListViewModel.photoAtIndex(indexPath.row)
        
        switch (mySegmentControl.selectedSegmentIndex) {
        case 0:
            let thumbnailUrl = URL(string: photoViewModel.thumbnailUrl)
            cell.bodyComment.isHidden = true
            cell.emailComment.isHidden = true
            cell.detailsTitleLabel.isHidden = false
            cell.detailsImageView.isHidden = false
            cell.detailsTitleLabel.text = photoViewModel.title
            cell.detailsImageView.sd_setImage(with: thumbnailUrl, placeholderImage: UIImage(named: "placeholder"))
            break
        case 1:
            let commentViewModel = self.commentListViewModel?.commentAtIndex(indexPath.row)
            cell.detailsImageView.isHidden = true
            cell.detailsTitleLabel.isHidden = true
            cell.bodyComment.isHidden = false
            cell.emailComment.isHidden = false
            cell.emailComment.text = commentViewModel?.email
            cell.bodyComment.text = commentViewModel?.body
            break
        default:
            break
        }
        return cell
    }
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        detailsTableView.reloadData()
    }
    
}
