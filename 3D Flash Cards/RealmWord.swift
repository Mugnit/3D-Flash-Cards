//
//  realmSwifrt.swift
//  3D Flash Cards
//
//  Created by mat4645 on 2018/09/24.
//Copyright © 2018年 Mugnit. All rights reserved.
//

import Foundation
import RealmSwift

class RealmWord: Object {
    @objc dynamic var id: String = NSUUID().uuidString
    @objc dynamic var WLid = ""
    @objc dynamic var word1 = ""
    @objc dynamic var word2 = ""
    @objc dynamic var word3 = ""
    @objc dynamic var date = Date()
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
