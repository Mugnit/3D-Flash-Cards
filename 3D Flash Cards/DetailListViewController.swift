//
//  DetailListViewController.swift
//  3D Flash Cards
//
//  Created by 和泉淳喜 on 2018/08/27.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit


class DetailListViewController:UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        tableView.reloadData()
        self.tableView.reloadData()
    }
    @IBAction func openInputWord(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard?.instantiateViewController(withIdentifier: "DetailInputController")
        self.present(second!, animated: true, completion: nil)
    }
    
    
}
