//
//  InputController.swift
//  3D Flash Cards
//
//  Created by 和泉淳喜 on 2018/08/28.
//  Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import UIKit

class InputController: UIViewController{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var inputJapanese: UITextField!
    @IBOutlet weak var inputEnglish: UITextField!
    @IBOutlet weak var inputOtherLanguage: UITextField!
    override func viewWillAppear(_ animated: Bool) {      //よくわからない
        titleLabel.textAlignment = NSTextAlignment.center //テキストラベルを中央寄せ
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //appdelegateから他クラスのメソッドを呼び出す
        
    }
    
    @IBAction func createWordButton(_ sender: Any) {
    }
    
    
}
