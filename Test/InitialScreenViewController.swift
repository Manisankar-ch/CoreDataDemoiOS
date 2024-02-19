//
//  InitialScreenViewController.swift
//  Test
//
//  Created by Softsuave on 15/02/24.
//

import Foundation
import UIKit

class InitialScreenViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    
    private let manager: InfoManager = InfoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @IBAction func actionOnConfirmBtn(_ sender: UIButton) {
        if let name = nameTextField.text, let ageString = ageTextField.text, let age = Int(ageString) {
            manager.addStudent(student: Student(name: name, age: Int32(age), id: UUID()))
        }
        if let vc = ViewController.makeViewController() {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
