//
//  InfoManager.swift
//  Test
//
//  Created by Softsuave on 15/02/24.
//

import Foundation


class InfoManager: InfoRepoProtocol {
    
    private let infoRepo = InfoRepository()
    
    func addStudent(student: Student) {
        infoRepo.addStudent(student: student)
    }
    
    func getStudents() -> [Student]? {
        return infoRepo.getStudents()
    }
    
    func updateStudent(student: Student) -> Bool {
        return infoRepo.updateStudent(student: student)
    }
    
    func get(id: UUID) -> Student? {
        infoRepo.get(id: id)
    }
    
    func deleteStudent(id: UUID) -> Bool {
        infoRepo.deleteStudent(id: id)
    }
    
}
