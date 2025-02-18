//
//  InfoRepository.swift
//  Test
//

import Foundation
import CoreData

protocol InfoRepoProtocol {
    
    func getStudents() -> [Student]?
    
    func updateStudent(student: Student) -> Bool
    
    func addStudent(student: Student)
    
    func deleteStudent(id: UUID) -> Bool
    
}

struct InfoRepository: InfoRepoProtocol {
    
    func get(id: UUID) -> Student? {
        return getParticularStudent(id: id)?.convertToStudent()
    }
    
    
    func updateStudent(student: Student) -> Bool {
        let stu = getParticularStudent(id: student.id)
        guard stu != nil else {return false}
        stu?.name = student.name
        stu?.age = student.age
        CoreDataManager.getInstance().saveContext()
        return true
        
    }
    
    
    func getStudents() -> [Student]? {
       let result = CoreDataManager.fetchmanageObject(manangeObject: StudentEntity.self)
        var studentList: [Student] = []
        result?.forEach({ value in
            studentList.append(value.convertToStudent())
        })
        return studentList
    }

    
    func addStudent(student: Student) {
        let stu = StudentEntity(context: CoreDataManager.getInstance().context)
        stu.age = student.age
        stu.name = student.name
        stu.id = student.id
        stu.author = student.author
        CoreDataManager.getInstance().saveContext()
    }
    
    func deleteStudent(id: UUID) -> Bool {
        guard let stu = getParticularStudent(id: id)
        else { return false }
        CoreDataManager.getInstance().context.delete(stu)
        CoreDataManager.getInstance().saveContext()
        return true
        
    }
    
    
    private func getParticularStudent(id: UUID) -> StudentEntity? {
        let fetchrequest = NSFetchRequest<StudentEntity>(entityName: "StudentEntity")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        
        fetchrequest.predicate = predicate
        do {
            guard let result = try CoreDataManager.getInstance().context.fetch(fetchrequest).first  else { return nil }
            return result
        }
        catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    
}
