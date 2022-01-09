//
//  CoreDataLayer.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import Foundation
import UIKit
import CoreData
class CoreDataLayer : UIViewController {
    static let shared = CoreDataLayer()
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    func context() ->  NSManagedObjectContext {
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    func save() {
        appDelegate.saveContext()
    }
    func saveArtical(artical: Article){
        if artical.title == nil {return}
        let entity = NSEntityDescription.entity(forEntityName: "ArticalCD", in: context())
        let articalManagedObject = NSManagedObject(entity: entity!, insertInto: context())
        if isExist(id: artical.title ?? "") == false {
            articalManagedObject.setValue(artical.author, forKey: "author")
            articalManagedObject.setValue(artical.publishedAt, forKey: "date")
            articalManagedObject.setValue(artical.articleDescription, forKey: "desc")
            articalManagedObject.setValue(artical.source?.name, forKey: "nameSource")
            articalManagedObject.setValue(artical.title, forKey: "title")
            articalManagedObject.setValue(artical.urlToImage, forKey: "urlImage")

            do {
                try context().save()
                print("success")
                print(articalManagedObject)
            } catch let error as NSError {
                print(error)
            }
    
        }
        

    }
    
    func deleteArtical(title: String){
        let context = context()
        let fetchRequest: NSFetchRequest<ArticalCD> = ArticalCD.fetchRequest()
        let objects = try! context.fetch(fetchRequest)
        
        for obj in objects {
            if obj.value(forKey: "title") as? String == title{
                print(obj)
                context.delete(obj)
            }
        }
        do {
            try context.save()
            print(fetchRequest)
        } catch {
            print("Error Delete Object")
        }
    }
    func getArticals() -> ([ArticalCD]?){
        cleanFav()
        do{
            let items = try context().fetch(ArticalCD.fetchRequest())
            if !items.isEmpty{
                return (items)
            }
            return (nil)
        }
        catch let error{
            print("Can't Get articles",error)
            return (nil)
        }
            
    }

    func isExist(id: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ArticalCD")
        fetchRequest.predicate = NSPredicate(format: "title = %@", id)

        let res = try! context().fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
    func cleanFav(){
        let context = context()
        let fetchRequest: NSFetchRequest<ArticalCD> = ArticalCD.fetchRequest()
        let objects = try! context.fetch(fetchRequest)
        
        for obj in objects {
            if obj.value(forKey: "title") as? String == nil{
                print(obj)
                context.delete(obj)
            }
            
        }
        do {
            try context.save()
            print(fetchRequest)
        } catch {
            print("Error Delete Object")
        }
    }
}
