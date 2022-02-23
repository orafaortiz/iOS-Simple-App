//
//  TodoService.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import Foundation

struct TodoService {
    
    var api = APILoader()
    
    func getTodos(completion: @escaping (Result<[Todo], Error>) -> Void) {
        
        guard let url = URL(string: PlaceholderAPI.todos) else {
            print("URL to get TO-DOs is invalid")
            return
        }
        
        api.getData(url: url) { result in
            
            switch result {
            case .failure(let error) :
                print(error)
                
            case .success(let data) :
                
                guard let todos = try? JSONDecoder().decode([Todo].self, from: data as! Data) else {
                    print("Error on decode Todos")
                    return
                }
                
                completion(.success(todos))
            }
        }
    }
}

