//
//  CoreDataManager.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "FrameworkTest")
        persistentContainer.loadPersistentStores { _, error in
            
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func getPost (_ id: NSManagedObjectID) -> PostItem? {

        do {
            return try moc.existingObject(with: id) as? PostItem
        } catch {
            print(error)
        }
        return nil
    }

    func savePost(body: String, title: String) {
        persistentContainer.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        let post = PostItem(context: moc)
        
        //post.setValue(id, forKey: "id")
        post.setValue(body, forKey: "body")
        post.setValue(title, forKey: "title")

        do {
            try moc.save()
        } catch let error as NSError{
            NSLog("\(error)")
        }
    }

    func fetchPosts() -> [PostItem] {
        do {
            let fetchRequest = NSFetchRequest<PostItem>(entityName: "PostItem")
            let posts = try moc.fetch(fetchRequest)
            return posts
        } catch let error as NSError{
            print(error)
            return []
        }
    }
}
