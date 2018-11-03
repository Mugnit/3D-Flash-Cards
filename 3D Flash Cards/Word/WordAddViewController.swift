//
//  WordAddViewController.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/10/08.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import UIKit

class WordAddViewController: UIViewController,UITextFieldDelegate {
    
    //文字列保存用の変数
    var FirstWordTextString = ""
    var SecondWordTextString = ""
    var ThirdWordTextString = ""
    

    @IBOutlet weak var FirstWordButton: UIButton! //第一言語を入れるボタン
    @IBOutlet weak var SecondWordButton: UIButton!
    @IBOutlet weak var ThirdWordButton: UIButton!
    @IBAction func cancelButton(_ sender: Any) { //戻るボタン
        self.dismiss(animated: true, completion: nil)
        }
    @IBOutlet weak var AddFlashCardButton: UIButton!
    
    @IBOutlet weak var FirstWordText: UITextField! //テキストボックス
    @IBOutlet weak var SecondWordText: UITextField!
    @IBOutlet weak var ThirdWordText: UITextField!
    @IBAction func AddFlashCardButton(_ sender: Any) { //単語帳追加にアラート表示
        
        let alertadd: UIAlertController = UIAlertController(title: "nil", message: "nil", preferredStyle: .alert)
        alertadd.title = "単語帳追加"
        alertadd.message = "単語帳に追加してよろしいですか？"
        
        alertadd.addAction( //OKボタン
            UIAlertAction(
                title: "OK",
                style: .default) { action -> Void in
                    //Okボタンを押したらテキストフィールド内の文字列を取得
                    self.FirstWordTextString = self.FirstWordText.text!
                    self.SecondWordTextString = self.SecondWordText.text!
                    self.ThirdWordTextString = self.ThirdWordText.text!
                    
                    //OKを押したら画面遷移
                   self.performSegue(withIdentifier: "GoWEV", sender: nil)
                    
                   
                    
            }
        )
        
        
        alertadd.addAction(
            UIAlertAction(
            title: "キャンセル",
            style: .cancel)   { action -> Void in
            
            //キャンセルボタンを押したら文字列をリセット
            self.FirstWordText.text = ""
            self.SecondWordText.text = ""
            self.ThirdWordText.text = ""
            }
        )
        
        self.present( alertadd, animated: true, completion: nil)
        
        
        
        
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstWordText.delegate = self  //userdefaults
        SecondWordText.delegate = self
        ThirdWordText.delegate = self
        
        
        
        let FWVColor = UIColor(red: 255/255, green: 0/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        FirstWordButton.backgroundColor = FWVColor                                          // 背景色
        FirstWordButton.layer.borderWidth = 1.0                                              // 枠線の幅
        FirstWordButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        FirstWordButton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        let SWVColor = UIColor(red: 255/255, green: 0/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        SecondWordButton.backgroundColor = SWVColor                                          // 背景色
        SecondWordButton.layer.borderWidth = 1.0                                              // 枠線の幅
        SecondWordButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        SecondWordButton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        let TWVColor = UIColor(red: 255/255, green: 0/255, blue: 168/255, alpha: 1.0) // ボタン背景色設定
        ThirdWordButton.backgroundColor = TWVColor                                          // 背景色
        ThirdWordButton.layer.borderWidth = 1.0                                              // 枠線の幅
        ThirdWordButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        ThirdWordButton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        let FCBColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 1.0) // ボタン背景色設定
        AddFlashCardButton.backgroundColor = FCBColor                                          // 背景色
        AddFlashCardButton.layer.borderWidth = 1.0                                              // 枠線の幅
        AddFlashCardButton.layer.borderColor = UIColor.black.cgColor                            // 枠線の色
        AddFlashCardButton.layer.cornerRadius = 10.0
       
        
        
        AddFlashCardButton.setTitleColor(UIColor.white, for: UIControlState.normal)//よくわからない
        
        
        
        // Do any additional setup after loading the view.
        
        //単語の名前をWordEditViewに引き継ぐ 
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "GoWEV"){
                
                let wordEditViewController: WordEditViewController = (segue.destination as? WordEditViewController)!
                
                let getTextWord1:String = FirstWordTextString
                let getTextWord2:String = SecondWordTextString
                let getTextWord3:String = ThirdWordTextString
                
                wordEditViewController.willgetTextword1 = getTextWord1
                wordEditViewController.willgetTextword2 =  getTextWord2
                wordEditViewController.willgetTextword3 = getTextWord3
                
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
}
