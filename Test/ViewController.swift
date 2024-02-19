//
//  ViewController.swift
//  Test
//
//  Created by Softasuave on 03/02/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    
    let coreDataInstance = CoreDataManager.getInstance()
    private var manager = InfoManager()
    var studentList: [Student] = []
    
    static func makeViewController() -> ViewController? {
        if let newViewController = UiUtils.getViewController(viewController: self) {
            return newViewController
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerNib()
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        studentList = manager.getStudents() ?? []
        if !studentList.isEmpty {
            mainTableView.reloadData()
        }
    }
    
    func registerNib() {
        mainTableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
    }
    func registerVerticalTableViewCellNib() {
        mainTableView.register(UINib(nibName: "VerticalTableViewCell", bundle: nil), forCellReuseIdentifier: "VerticalTableViewCell")
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Utils.colors_Array.count + 1
        return studentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "VerticalTableViewCell", for: indexPath) as! VerticalTableViewCell
//        cell.configureCell(isCollectionView: indexPath.row == 0)
//        cell.backgroundColor = indexPath.row != 0 ? Utils.colors_Array[indexPath.row - 1] : .white
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        
        cell.configureCell(name: studentList[indexPath.row].name ?? "" , age: "\(studentList[indexPath.row].age)")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == 0 {
//            return 200
//        }
//        return 250
        
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = EditInfoViewController.makeViewController() {
            vc.student = studentList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
