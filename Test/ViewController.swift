//
//  ViewController.swift
//  Test
//
//  Created by Softasuave on 03/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!
    
    var emptyTitleLabel = {
        var label = UILabel()
        label.text = "Add new note"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let coreDataInstance = CoreDataManager.getInstance()
    private var manager = InfoManager()
    var studentList: [Student] = []
    
    static func makeViewController() -> ViewController? {
        if let newViewController = UiUtils.getViewController(viewController: self) {
            return newViewController
        }
        return nil
    }
    
    @IBAction func actionOnSaveButton(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InitialScreenViewController") as! InitialScreenViewController
        vc.callBackAction = { [weak self] in
            self?.updateStudents()
        }
           self.present(vc, animated: true, completion: nil)
    }
    
    private func navigateToDetailScreen(student: Student) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InitialScreenViewController") as! InitialScreenViewController
        vc.student = student
        self.present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNib()
        mainTableView.dataSource = self
        mainTableView.delegate = self
        authorTextField.isHidden = true
        nameTextField.isHidden = true
        view.addSubview(emptyTitleLabel)
        addConstraints()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateStudents()
    }

    func updateStudents() {
        studentList = manager.getStudents() ?? []
        if !studentList.isEmpty {
            emptyTitleLabel.isHidden = true
        } else {
            emptyTitleLabel.isHidden = false
        }
        mainTableView.reloadData()
    }
    
    func registerNib() {
        mainTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
    }
    
    func registerVerticalTableViewCellNib() {
        mainTableView.register(UINib(nibName: "VerticalTableViewCell", bundle: nil), forCellReuseIdentifier: "VerticalTableViewCell")
    }
    
    func addConstraints() {
        emptyTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emptyTitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        let data = studentList[indexPath.row]
        cell.configureCell(name: data.name ?? "", age: data.author)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = studentList[indexPath.row]
        navigateToDetailScreen(student: student)
    }
}
