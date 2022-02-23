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
    
    // Posts
    func getPost (_ id: NSManagedObjectID) -> PostItem? {

        do {
            return try moc.existingObject(with: id) as? PostItem
        } catch {
            print(error)
        }
        return nil
    }

    func savePost(body: String, title: String) {
        moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
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
    
    // Albums
    func getAlbum (_ id: NSManagedObjectID) -> AlbumItem? {

        do {
            return try moc.existingObject(with: id) as? AlbumItem
        } catch {
            print(error)
        }
        return nil
    }

    func saveAlbum(title: String) {
        moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        let album = AlbumItem(context: moc)
        
        album.setValue(title, forKey: "title")

        do {
            try moc.save()
        } catch let error as NSError{
            NSLog("\(error)")
        }
    }

    func fetchAlbums() -> [AlbumItem] {
        do {
            let fetchRequest = NSFetchRequest<AlbumItem>(entityName: "AlbumItem")
            let albums = try moc.fetch(fetchRequest)
            return albums
        } catch let error as NSError{
            print(error)
            return []
        }
    }
    
    // TO-DOs
    func getTodo (_ id: NSManagedObjectID) -> TodoItem? {

        do {
            return try moc.existingObject(with: id) as? TodoItem
        } catch {
            print(error)
        }
        return nil
    }

    func saveTodo(title: String, completed: Bool) {
        moc.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        let todo = TodoItem(context: moc)
        
        todo.setValue(title, forKey: "title")
        todo.setValue(completed, forKey: "completed")

        do {
            try moc.save()
        } catch let error as NSError{
            NSLog("\(error)")
        }
    }

    func fetchTodos() -> [TodoItem] {
        do {
            let fetchRequest = NSFetchRequest<TodoItem>(entityName: "TodoItem")
            let todos = try moc.fetch(fetchRequest)
            return todos
        } catch let error as NSError{
            print(error)
            return []
        }
    }
}
