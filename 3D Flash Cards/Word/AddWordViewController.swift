//
//  AddWordViewController.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/10/08.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit
import RealmSwift

class AddWordViewController: UIViewController {
    lazy var realm = try! Realm()
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var firstWord: UITextField!
    @IBOutlet weak var secondWord: UITextField!
    @IBOutlet weak var thirdWord: UITextField!
    //一つ前の画面から渡されたid(単語帳のIDと単語を紐づけるため)
    var getId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.title = "戻る"
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    //戻るボタン
    @IBAction func backButtonTaped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //単語追加ボタン
    @IBAction func addWordButtonTaped(_ sender: Any) {
        let realm = try! Realm()
        let realmWord = RealmWord()
        realmWord.WLid = getId!
        realmWord.word1 = firstWord.text!
        realmWord.word2 = secondWord.text!
        realmWord.word3 = thirdWord.text!
        try! realm.write{
            realm.add(realmWord)
        }
        
        let alert: UIAlertController = UIAlertController(title: "単語追加", message: "完了しました", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK",style: .cancel) { action -> Void in
            // キャンセルを押した時の処理
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
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
