//
//  AlbumService.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import Foundation

struct AlbumService {
    
    var api = APILoader()
    
    func getAlbums(completion: @escaping (Result<[Album], Error>) -> Void) {
        
        guard let url = URL(string: PlaceholderAPI.albums) else {
            print("URL to get albums is invalid")
            return
        }
        
        api.getData(url: url) { result in
            
            switch result {
            case .failure(let error) :
                print(error)
                
            case .success(let data) :
                
                guard let albums = try? JSONDecoder().decode([Album].self, from: data as! Data) else {
                    print("Error on decode Albums")
                    return
                }
                
                completion(.success(albums))
            }
        }
    }
}
