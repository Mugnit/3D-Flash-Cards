//
//  ListViewController.swift
//  3D Flash Cards
//
//  Created by 和泉淳喜 on 2018/08/27.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit
import RealmSwift

class NoteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate {
    
    //Realmの内容
    lazy var realm = try! Realm()
    var wordListItems: Results<RealmWordList>!
    var searchResults:[String] = []
    var selectedText: String?
    @IBOutlet weak var searchBarWL: UISearchBar!
    @IBOutlet weak var wLTableView: UITableView!
    @IBOutlet weak var editWL: UIBarButtonItem!
    
    //画面が表示される際などにWordListTableViewのデータを再読み込みする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wLTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ナビゲーションバーの文字を「編集」に変更
        self.editWL.title = "編集"
        
        // 永続化されているデータを取りだす
        do{
            let realm = try Realm()
            wordListItems = realm.objects(RealmWordList.self)
            wLTableView.reloadData()
        }catch{
        }
        //tableViewのヘッダにSearchBarを設置
        wLTableView.tableHeaderView = searchBarWL
        
        //サーチバーの設定
        searchBarWL.searchBarStyle = UISearchBarStyle.default
        searchBarWL.showsSearchResultsButton = false
        searchBarWL.placeholder = "検索"
        searchBarWL.setValue("キャンセル", forKey: "_cancelButtonText")
        searchBarWL.delegate = self
        searchBarWL.showsCancelButton = false
        searchBarWL.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:42)
        searchBarWL.layer.position = CGPoint(x: self.view.bounds.width/2, y: 89)
        
    }
    
//検索バーの設定(サーチバーに入力した内容でwordListItemsの中身を書き換え)
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let realm = try! Realm()
        
        if searchText.isEmpty {
            wordListItems = realm.objects(RealmWordList.self)
        } else {
            wordListItems = realm.objects(RealmWordList.self).filter("wordListName CONTAINS %@", searchText)
        }
        wLTableView.reloadData()
    }
    
    // キャンセルボタンが押された時に呼ばれる
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked")
        searchBarWL.showsCancelButton = false
        self.view.endEditing(true)
        let realm = try! Realm()
        wordListItems = realm.objects(RealmWordList.self)
        searchBarWL.text = ""
        wLTableView.reloadData()
    }
    
    // テキストフィールド入力開始前に呼ばれる
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldBeginEditing")
        searchBarWL.showsCancelButton = true
        return true
    }
    


//テーブルビューの設定
    //セクションの数を設定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //セルの数を取得
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "WordListNameCell", for: indexPath)
        
        
        // セルに表示する値を設定する
        let object = wordListItems[indexPath.row]
        cell.textLabel?.text = object.wordListName.description
        return cell
    }
    
    //削除時の操作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.wordListItems![indexPath.row])
                }
                tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.none)
            }catch{
            }
            self.wLTableView.reloadData()
        }
    }
    //編集モードでないと削除できないように設定
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if tableView.isEditing {
            return UITableViewCellEditingStyle.delete
        } else {
            return UITableViewCellEditingStyle.none
        }
    }
    //並び替えの設定
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        try! realm.write {
//            let sourceObject = objectsR[sourceIndexPath.row]
//            objectsR.remove(at: sourceIndexPath.row)
//            objectsR.insert(sourceObject, at: destinationIndexPath.row)
//
//            let destinationObject = wordListItems[destinationIndexPath..row]
//
//            let destinationObjectOrder = destinationObject.order
//
//            if sourceIndexPath.row < destinationIndexPath.row {
//                // 上から下に移動した場合、間の項目を上にシフト
//                for index in sourceIndexPath.row...destinationIndexPath.row {
//                    let object = wordListItems[index]
//                    object.order -= 1
//                }
//            } else {
//                // 下から上に移動した場合、間の項目を下にシフト
//                for index in (destinationIndexPath.row..<sourceIndexPath.row).reversed() {
//                    let object = wordListItems[index]
//                    object.order += 1
//                }
//            }
//            // 移動したセルの並びを移動先に更新
//            sourceObject.order = destinationObjectOrder
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    //Cellを選択した時に次の画面に選択したCellのwordListNameを引き継ぐ
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "WLnext"){
            let indexPath = self.wLTableView.indexPathForSelectedRow
            let indexPathsRow = wordListItems![indexPath!.row]
            let selectedText = indexPathsRow.wordListName
            let selectedId = indexPathsRow.id
            let noteMainVC: NoteMainViewController = (segue.destination as? NoteMainViewController)!
            print(noteMainVC.getText as Any)
            noteMainVC.getText = selectedText
            noteMainVC.getId = selectedId
            
        }
    }
    

    
//編集ボタンの設定
    


    @IBAction func tapEditWL(_ sender: Any) {
        if isEditing {
            super.setEditing(false, animated: true)
            wLTableView.setEditing(false, animated: true)
            self.editWL.title = "編集"
        } else {
            super.setEditing(true, animated: true)
            wLTableView.setEditing(true, animated: true)
            self.editWL.title = "完了"
        }
    }
    

    
    
//「単語帳を追加」ボタンの設定
    
    @IBAction func addList(_ sender: UIButton) {
        //追加を押した時にアラートコントローラーを表示させ、単語帳名を入力して保存する。
        let alert: UIAlertController = UIAlertController(title: "単語帳追加", message: "入力してください", preferredStyle: UIAlertControllerStyle.alert)
        
        //テキストフィールドを配置
        alert.addTextField(configurationHandler: {(textField: UITextField) -> Void in
            textField.placeholder = "ここに単語帳名を入力"
        })
        
        //キャンセルボタンを配置
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel) { action -> Void in
            // キャンセルを押した時の処理
        }
        alert.addAction(cancelAction)
        
        //追加ボタンを配置
        let addAction: UIAlertAction = UIAlertAction(title: "追加", style: .default) { action -> Void in
            //追加ボタンを押した時の処理
            //テキストフィールドの内容を取得
            let textField = alert.textFields![0] as UITextField
            if textField.text!.count != 0 {
                //データベースへの入力
                let realm = try! Realm()
                let realmWordList = RealmWordList()
                realmWordList.wordListName = textField.text!
                try! realm.write {
                    realm.add(realmWordList)
                }
            }
            self.wLTableView.reloadData()
        }
        alert.addAction(addAction)
        
        
        
        self.present(alert, animated: true, completion: nil)
    }
}
