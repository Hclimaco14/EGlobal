//
//  CoredataManager.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//

import Foundation
import CoreData

public class CoreDataManager:NSObject {
    static let shared: CoreDataManager = .init()
    static let moduleName = "Eglobal"
    
    private override init() {}
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataManager.moduleName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Core Data Error")
                print("Store not loaded: \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    public lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    func saveContext () {
        let context = viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                print("Error Save Context: \(error), \(error.userInfo)")
            }
        }
    }
    
    func saveUser(user: RegisterUser.Response) {
        let managedContext = viewContext
        let coreDataUser = EglobalUser(context: managedContext)
        
        coreDataUser.uuid = UUID().uuidString
        coreDataUser.ageCD = user.age
        coreDataUser.firstNameCD = user.firstName
        coreDataUser.lastNameCD = user.lastName
        do {
            try managedContext.save()
        } catch _ as NSError {
            NSLog("Error in Save User")
        }
    }
    
    func getUsers() ->[RegisterUser.ViewModel] {
        var users:[RegisterUser.ViewModel] = []
        let moc = viewContext
        let usersFetchRequest: NSFetchRequest<EglobalUser> = EglobalUser.fetchRequest()
        
        do {
            let fetchedUsersCD = try moc.fetch(usersFetchRequest)
            
            users = fetchedUsersCD.compactMap{ user in
                mapUser(user: user) }
        } catch {
            
        }
        return users
    }
    
    
    fileprivate func mapUser(user: EglobalUser) -> RegisterUser.ViewModel? {
        guard let firstName = user.firstNameCD,
                let lastName = user.lastNameCD,
              let age = user.ageCD else {
            return nil
        }
        
        return RegisterUser.ViewModel(uuid: user.uuid, firstName:firstName,lastName: lastName,age: age)
    }
    
    func deleteUser(user: RegisterUser.ViewModel) {
        let moc = viewContext
        let usersFetchRequest: NSFetchRequest<EglobalUser> = EglobalUser.fetchRequest()
        let predicate = NSPredicate(format: "uuid = %@", user.uuid)
        
        do {
            let fetchedResults = try moc.fetch(usersFetchRequest)
            
            if let user = fetchedResults.first {
                do {
                    moc.delete(user)
                    try moc.save()
                } catch {
                    print("Fail to delete user")
                }
            }
        }
        catch let error as NSError {
            print("fail to get user \(user.uuid) -> \(error.description)")
            return
        }
    }
    
    
    
}
