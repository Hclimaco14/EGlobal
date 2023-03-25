//
//  EglobalUser+CoreDataProperties.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//
//

import Foundation
import CoreData


extension EglobalUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EglobalUser> {
        return NSFetchRequest<EglobalUser>(entityName: "EglobalUser")
    }

    @NSManaged public var uuid: String
    @NSManaged public var ageCD: String?
    @NSManaged public var firstNameCD: String?
    @NSManaged public var lastNameCD: String?

}

extension EglobalUser : Identifiable {

}
