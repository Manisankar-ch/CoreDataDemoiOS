//
//  StudentEntity+CoreDataProperties.swift
//  Test
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
    @NSManaged public var author: String?
    
    
    func convertToStudent() -> Student {
        
        return Student(name: self.name, age: self.age, id: self.id!, author: self.author ?? "")
    }
}

extension StudentEntity : Identifiable {

}
