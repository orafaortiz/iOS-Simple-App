//
//  PostService.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 17/02/22.
//

import Foundation


struct PostService {
    
    var api = APILoader()
    
    func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        
        guard let url = URL(string: PlaceholderAPI.posts) else {
            print("URL to get posts is invalid")
            return
        }
        
        api.getData(url: url) { result in
            
            switch result {
            case .failure(let error) :
                print(error)
                
            case .success(let data) :
                
                guard let posts = try? JSONDecoder().decode([Post].self, from: data as! Data) else {
                    print("Error on decode Posts")
                    return
                }
                
                completion(.success(posts))
            }
        }
    }
}
