//
//  CoreDataManager.swift
//  RoomApp
//
//  Created by Angelo Essam on 01/12/2021.
//

import Foundation
import CoreData


class CoreDataManager{
    
    let persistentCotainer : NSPersistentContainer
    static let shared = CoreDataManager()
    
    
    private init(){
        ValueTransformer.setValueTransformer(NSColorTransformer(), forName: NSValueTransformerName("NSColorTransformer"))
        persistentCotainer = NSPersistentContainer(name: "Model")
        persistentCotainer.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Unble Load Core Data \(error)")
            }
            
        }
    }
}
