//
//  WordList.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/09/25.
//Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWordList: Object {
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var wordListName = ""
    @objc dynamic var date = Date()
// Specify properties to ignore (Realm won't persist these)
//    override static func primaryKey() -> String? {
//        return "id"
//    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

class AddRealmWordList {
    
    func createNewRWL(addWLName: String) {
        
        let realmWordList = RealmWordList()
        realmWordList.wordListName = addWLName
        let realm = try! Realm()
        try! realm.write{ realm.add(realmWordList) }
    }
}
