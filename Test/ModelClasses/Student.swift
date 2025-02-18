//
//  Student.swift
//  Test
//
import Foundation


struct Student {
    
    var name: String?
    var age: Int32
    var id: UUID
    var author: String = ""
    
    init(name: String?, age: Int32, id: UUID, author: String) {
        self.name = name
        self.age = age
        self.id = id
        self.author = author
    }
}
