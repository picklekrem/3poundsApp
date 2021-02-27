//
//  Webservice.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 23.02.2021.
//


import Foundation


class Webservice {
    
    
    func albumDataFetch(url : URL, completion : @escaping ([AlbumModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
             if let data = data {
                do {
                    let dataList = try JSONDecoder().decode([AlbumModel].self, from: data)
                    completion(dataList)
                    
//                    print(pageQuery)
                }catch DecodingError.dataCorrupted(let context) {
                    print(context)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.valueNotFound(let value, let context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch DecodingError.typeMismatch(let type, let context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }.resume()
    }
    
    func photoDataFetch(url : URL, albumId : Int, completion : @escaping ([PhotoModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                
            }
            if let data = data {
               do {
                let dataList = try JSONDecoder().decode([PhotoModel].self, from: data)
                completion(dataList)
                
                //                    print(pageQuery)
               }catch DecodingError.dataCorrupted(let context) {
                print(context)
               } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch {
                print("error: ", error)
               }
            }
        }.resume()
    }
    
    func commentDataFetch(url : URL, postId : Int, completion : @escaping ([CommentModel]?) -> ()){
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                
            }
            if let data = data {
               do {
                let dataList = try JSONDecoder().decode([CommentModel].self, from: data)
                completion(dataList)
                
                //                    print(pageQuery)
               }catch DecodingError.dataCorrupted(let context) {
                print(context)
               } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
               } catch {
                print("error: ", error)
               }
            }
        }.resume()
    }
}
