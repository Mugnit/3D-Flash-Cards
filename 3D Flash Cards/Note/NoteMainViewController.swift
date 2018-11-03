//
//  NoteMainViewController.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/10/08.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit

class NoteMainViewController: UIViewController {
    @IBOutlet weak var wordListlabel: UINavigationItem!
    @IBOutlet weak var back: UIBarButtonItem!
    
    //一つ前の画面から渡されたwordListName
    var getText: String?
    //一つ前の画面から渡されたid(ここでは使わずに次の画面に引き継ぐ)
    var getId: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordListlabel.title = getText
        self.back.title = "戻る"

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //Cellを選択した時に次の画面に選択したCellのwordListNameを引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "moveToWordListTableView"){
            let wordListTableVC: WordListTableViewController = (segue.destination as? WordListTableViewController)!
            print(wordListTableVC.getText as Any)
            wordListTableVC.getText = getText
            wordListTableVC.getId = getId
        }
    }
    
    
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
