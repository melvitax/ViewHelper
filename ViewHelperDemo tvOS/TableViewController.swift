//
//  TableViewController.swift
//  ViewHelper
//
//  Created by Melvin Rivera on 11/26/16.
//  Copyright © 2016 All Forces. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var selected: Int = 0
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.selectRow(at: IndexPath(item: selected, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.middle)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        if self.title == selectedAnimationKey {
            UserDefaults.standard.set(selected, forKey: selectedAnimationKey)
        } else {
            UserDefaults.standard.set(selected, forKey: selectedEasingCurveKey)
        }
        UserDefaults.standard.synchronize()
    }

}
