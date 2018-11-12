//
//  ViewController.swift
//  IOS-Swift-MultipleTableViewsInOneViewController
//
//  Created by Pooya on 2018-11-11.
//  Copyright © 2018 Pooya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var topTableView: UITableView!
    @IBOutlet weak var downTableView: UITableView!
    var topTableData : [String] = []
    var downTableData : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTableView.delegate = self
        downTableView.delegate = self
        topTableView.dataSource = self
        downTableView.dataSource = self
        
        for index in 0...20 {
            topTableData.append("top table row \(index)")
        }
        
        for index in 10...40 {
            downTableData.append("down table row \(index)")
        }
        print(downTableView)
        
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 1
        switch tableView {
        case topTableView:
            numberOfRow = topTableData.count
        case downTableView :
            numberOfRow = downTableData.count
        default:
            print("Some Things Wrong!!")
        }
        
        return numberOfRow
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch tableView {
        case topTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "topCell", for: indexPath)
            cell.textLabel?.text = topTableData[indexPath.row]
            cell.backgroundColor = UIColor.lightGray
        case downTableView :
            cell = tableView.dequeueReusableCell(withIdentifier: "downCell", for: indexPath)
            cell.textLabel?.text = downTableData[indexPath.row]
            cell.backgroundColor = UIColor.cyan
        default:
            print("Some Things Wrong!!")
        }
        return cell
    }
}

