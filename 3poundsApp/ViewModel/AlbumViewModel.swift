//
//  AlbumViewModel.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 23.02.2021.
//
//
import Foundation
//class AlbumViewModel {
//    func getAlbumData(completion : @escaping (AlbumModel?) -> ()){
//        Webservice().albumDataFetch() { (response) in
//            if let response = response {
//                print(response)
//            }
//        }
//    }
//}
struct AlbumListViewModel {
    let albumList : [AlbumModel]!
    
    func numberOfSection() -> Int{
        return self.albumList.count
    }
    
    func albumAtIndex(_ index: Int) -> AlbumViewModel {
        let album = self.albumList[index]
        return AlbumViewModel(albumVM: album)
    }
}

struct AlbumViewModel {
    let albumVM : AlbumModel
    var userID : Int {
        return self.albumVM.userId
    }
    var id : Int{
        return self.albumVM.id
    }
    var title : String{
        return self.albumVM.title
    }
}
