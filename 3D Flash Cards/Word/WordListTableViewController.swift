//
//  WordListTableViewController.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/10/08.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit
import RealmSwift

class WordListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    
    @IBOutlet weak var navigationItemlabel: UINavigationItem!
    @IBOutlet weak var searchBarWord: UISearchBar!
    @IBOutlet weak var wordTableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    lazy var realm = try! Realm()

    var searchResults:[String] = []
    var selectedText: String?
    //一つ前の画面から渡されたwordListName
    var getText: String?
    //一つ前の画面から渡されたid(ここでは使わずに次の画面に引き継ぐ)
    var getId: String?
    var wordItems: Results<RealmWord>!

    
    
    //画面が表示される際などにWordListTableViewのデータを再読み込みする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemlabel.title = getText
        self.backButton.title = "完了"
        let predicate = NSPredicate(format: "WLid = %@", getId!)
        wordItems = realm.objects(RealmWord.self).filter(predicate)
        wordTableView.reloadData()
        
    }

    
    //戻るボタン
    @IBAction func backButtonTaped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    //テーブルビューの設定
    
    //セクションの数を設定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //セルの数を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "WordNameCell", for: indexPath)
        // セルに表示する値を設定する
        let object = wordItems[indexPath.row]
        cell.textLabel?.text = object.word1
        return cell
    }
    
    
    //segueの設定（単語帳のIDを渡す）
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "moveToAddWordView"){
            let AddWordViewVC: AddWordViewController = (segue.destination as? AddWordViewController)!
            AddWordViewVC.getId = getId
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
