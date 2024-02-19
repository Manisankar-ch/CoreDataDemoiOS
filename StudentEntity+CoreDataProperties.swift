//
//  StudentEntity+CoreDataProperties.swift
//  Test
//
//  Created by Softsuave on 16/02/24.
//
//

import Foundation
import CoreData


extension StudentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StudentEntity> {
        return NSFetchRequest<StudentEntity>(entityName: "StudentEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int32
    @NSManaged public var id: UUID?

    
    
    func convertToStudent() -> Student {
        
        return Student(name: self.name, age: self.age, id: self.id!)
    }
}

extension StudentEntity : Identifiable {

}
