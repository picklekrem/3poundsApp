//
//  CommentViewModel.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import Foundation

struct CommentListViewModel {
    let commentList : [CommentModel]!
    func numberOfSection () -> Int{
        return self.commentList.count
    }
    func commentAtIndex (_ index: Int) -> CommentViewModel{
        let comment = self.commentList[index]
        return CommentViewModel(commentVM: comment)
    }
}

struct CommentViewModel {
    let commentVM : CommentModel
    var name : String{
        return self.commentVM.name
    }
    var email: String{
        return self.commentVM.email
    }
    var body: String{
        return self.commentVM.body
    }
}
