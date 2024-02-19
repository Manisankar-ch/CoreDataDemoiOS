//
//  EditInfoViewController.swift
//  Test
//
//  Created by Softsuave on 15/02/24.
//

import Foundation
import UIKit

class EditInfoViewController: UIViewController {

    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    var student: Student?
    private var manager = InfoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        student = manager.get(id: (student?.id)!)
        nameTextfield.text = student?.name
        ageTextField.text = "\(student!.age)"
        
    }
    
    static func makeViewController() -> EditInfoViewController? {
        if let newViewController = UiUtils.getViewController(viewController: self) {
            return newViewController
        }
        return nil
    }
    
    @IBAction func actionOnUpdateBtn(_ sender: UIButton) {
        if let name = nameTextfield.text, let ageField = ageTextField.text,  let age = Int32(ageField) {
            student?.name = name
            student?.age = age
            if let student = student, manager.updateStudent(student: student) {
                UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record updated") { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
            } else {
                UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record failed to update")
            }
         
           
        }
    }
    
    
    @IBAction func actionOnDeleteBtn(_ sender: UIButton) {
     
        if let student = student, manager.deleteStudent(id: student.id) {
            UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record deleted"){ [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        } else {
            UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record failed to delete")
        }
    }
}
