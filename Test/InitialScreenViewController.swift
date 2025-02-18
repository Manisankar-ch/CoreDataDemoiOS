//
//  InitialScreenViewController.swift
//  Test
//

import Foundation
import UIKit

class InitialScreenViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    var student: Student?
    
    var callBackAction: (() -> Void)?
    
    lazy var closeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionOnDeleteBtn), for: .touchUpInside)
        return button
    }()
    
    lazy var updateButton: UIButton = {
        var button = UIButton()
        button.backgroundColor = .blue
        button.titleLabel?.textColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionOnUpdate), for: .touchUpInside)
        return button
    }()
    
    let titleView: UILabel = {
        var label = UILabel()
        label.text = "Add new data"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let manager: InfoManager = InfoManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(closeButton)
        view.addSubview(titleView)
        addConstraints()
        
        
        if let student {
            buttonsStackView.addArrangedSubview(updateButton)
            buttonsStackView.addArrangedSubview(deleteButton)
            nameTextField.text = student.name
            ageTextField.text = student.author
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func actionOnDeleteBtn() {
        if let student = student, manager.deleteStudent(id: student.id) {
            UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record deleted") { [weak self] in
                self?.navigationController?.popViewController(animated: true)
            }
        } else {
            UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record failed to delete")
        }
    }
    
    @objc func actionOnUpdate() {
        if let name = nameTextField.text, !name.isEmpty, let ageField = ageTextField.text, !ageField.isEmpty {
            student?.name = name
            student?.age = Int32()
            student?.author = ageField
            if let student = student, manager.updateStudent(student: student) {
                UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record updated") { [weak self] in
                    self?.navigationController?.popViewController(animated: true)
                }
            } else {
                UiUtils.showDefaultAlertView(withTitle: "Alert", message: "record failed to update")
            }
         
           
        }
    }
    
    @objc func action() {
        dismiss(animated: true)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            titleView.topAnchor.constraint(equalTo: closeButton.topAnchor),
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    
    @IBAction func actionOnConfirmBtn(_ sender: UIButton) {
        if let name = nameTextField.text, !name.isEmpty, let ageString = ageTextField.text, !ageString.isEmpty {
            manager.addStudent(student: Student(name: name, age: Int32(Int()), id: UUID(), author: ageString))
        }
        callBackAction?()
        dismiss(animated: true)
    }
}
