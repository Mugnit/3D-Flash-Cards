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
    //一つ前の画面から渡されたwordListName
    var getText: String?
    //一つ前の画面から渡されたid(ここでは使わずに次の画面に引き継ぐ)
    var getId: String?
    
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var goeditbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordListlabel.title = getText //一つ前のコントローラーから持ってきた

        // Do any additional setup after loading the view.
        
        let rgba = UIColor(red: 255/255, green: 128/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        startbutton.backgroundColor = rgba                                               // 背景色
        startbutton.layer.borderWidth = 1.0                                              // 枠線の幅
        startbutton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        startbutton.layer.cornerRadius = 10.0                                            // 角丸のサイズ
        startbutton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        let color = UIColor(red: 0/255, green: 128/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        goeditbutton.backgroundColor = color                                               // 背景色
        goeditbutton.layer.borderWidth = 1.0                                              // 枠線の幅
        goeditbutton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        goeditbutton.layer.cornerRadius = 10.0                                            // 角丸のサイズ
        goeditbutton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //データ引き渡し　
        if segue.identifier == "ToWEVSegue" {
        let  WordEditVC: WordEditViewController! = segue.destination as? WordEditViewController
            WordEditVC.GetText = getText
            WordEditVC.GetId =   getId                //引き継ぎ内容  GetIdをWEVCに
            
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
