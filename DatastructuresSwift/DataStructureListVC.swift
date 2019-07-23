//
//  ViewController.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/19/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import UIKit

class DataStructureListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var arrayDatastrcutures = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayDatastrcutures = ["Array","Stack","Queue","LinkedList","Searching Algorithms","Sorting Algorithms","Trees","Graphs"]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDatastrcutures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = arrayDatastrcutures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switchToDesiredScreen(strDataStructure : arrayDatastrcutures[indexPath.row])
    }
    
    func switchToDesiredScreen(strDataStructure : String) {
        switch strDataStructure {
            case "Array" :
                self.performSegue(withIdentifier: "linkedlistSegue", sender: nil)
            case "Stack" :
                self.performSegue(withIdentifier: "stackSegue", sender: nil)
            case "Queue" :
                self.performSegue(withIdentifier: "queueSegue", sender: nil)
            case "LinkedList" :
                self.performSegue(withIdentifier: "linkedlistSegue", sender: nil)
            case "Searching Algorithms" :
                self.performSegue(withIdentifier: "segueLinkedlist", sender: nil)
            case "Sorting Algorithms" :
                self.performSegue(withIdentifier: "sortingSegue", sender: nil)
            case "Trees" :
                self.performSegue(withIdentifier: "binaryTreeSegue", sender: nil)
            case "Graphs" :
                self.performSegue(withIdentifier: "segueLinkedlist", sender: nil)
            default:
                print("default")
        }
    }
}

