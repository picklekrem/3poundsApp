//
//  PhotosViewModel.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import Foundation

struct PhotoListViewModel {
    let photoList : [PhotoModel]!
    
    func numberOfSection() -> Int{
        return self.photoList.count
    }
    func photoAtIndex (_ index: Int) -> PhotoViewModel{
        let photo = self.photoList[index]
        return PhotoViewModel(photoVM: photo)
    }
}

struct PhotoViewModel {
    let photoVM : PhotoModel
    var id : Int{
        return self.photoVM.id
    }
    var albumId : Int{
        return self.photoVM.albumId
    }
    var title : String{
        return self.photoVM.title
    }
    var url : String{
        return self.photoVM.url
    }
    var thumbnailUrl : String{
        return self.photoVM.thumbnailUrl
    }
}

