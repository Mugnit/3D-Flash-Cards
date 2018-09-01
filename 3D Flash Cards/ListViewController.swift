//
//  ListViewController.swift
//  3D Flash Cards
//
//  Created by 和泉淳喜 on 2018/08/27.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit
class ListViewController: UITableViewController {
    
    @IBAction func alertButton(_ sender: Any) {
        let alert: UIAlertController = UIAlertController(title: "タイトル", message: "タイトルを入力してください（例：挨拶)",
        preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: { (textField:UITextField) -> Void in
            textField.placeholder = "ここにタイトルを入力"
        })
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath)
                                            -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                                 for: indexPath)
        return cell
    }
    
    
    
}
