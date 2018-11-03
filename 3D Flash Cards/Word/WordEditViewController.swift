//
//  WordEditViewController.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/10/08.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit

class WordEditViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var GetText : String? //引き継いできたテキストとID
    var GetId : String?
    
     //WordAddViewControllerから引き継いできた単語名
    var willgetTextword1:String? = ""
    var willgetTextword2:String? = ""
    var willgetTextword3:String? = ""
    
   
    
    
    @IBOutlet weak var goWVbutton: UIButton!
    @IBOutlet weak var SWEDbar: UISearchBar!
    @IBOutlet weak var WEVCNavigatiion: UINavigationItem!
    
    
    
    @IBAction func ChangeFirstWordButton(_ sender: Any) {
    } //①ボタン
    @IBAction func ChangeSecondWordButton(_ sender: Any) {
    }
    @IBAction func ChangeThirdWordButton(_ sender: Any) {
    }
    @IBOutlet weak var WordEditTableView: UITableView! //テーブルビューアウトレット
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        WEVCNavigatiion.title = GetText //引き継いできた名前をタイトルに
        let goWVcolor = UIColor(red: 255/255, green: 0/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        goWVbutton.backgroundColor = goWVcolor                                             // 背景色
        goWVbutton.layer.borderWidth = 1.0                                              // 枠線の幅
        goWVbutton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        goWVbutton.layer.cornerRadius = 10.0                                            // 角丸のサイズ
        goWVbutton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        
        SWEDbar.searchBarStyle = UISearchBarStyle.default
        SWEDbar.showsSearchResultsButton = false
        SWEDbar.placeholder = "検索"
        SWEDbar.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:10)
        SWEDbar.setValue("キャンセル", forKey: "_cancelButtonText")
        SWEDbar.showsCancelButton = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backNMVbutton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //ここからテーブビューの設定
    
    //セクションの数を指定
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    //ボタン押下時の呼び出しメソッド
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
