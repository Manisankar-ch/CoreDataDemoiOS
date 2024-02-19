//
//  Student.swift
//  Test
//
//  Created by Softsuave on 16/02/24.
//

import Foundation


struct Student {
    
    var name: String?
    var age: Int32
    var id: UUID
    
    init(name: String?, age: Int32, id: UUID) {
        self.name = name
        self.age = age
        self.id = id
    }
}
