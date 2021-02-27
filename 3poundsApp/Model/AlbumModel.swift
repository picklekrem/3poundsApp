//
//  AlbumModel.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 23.02.2021.
//

import Foundation

struct AlbumModel : Decodable {
    var userId : Int
    var id : Int
    var title : String
}

struct PhotoModel : Codable {
    var albumId : Int
    var id : Int
    var title : String
    var url : String
    var thumbnailUrl : String
}

struct CommentModel : Decodable {
    var postId : Int
    var id : Int
    var name : String
    var email : String
    var body : String
}
