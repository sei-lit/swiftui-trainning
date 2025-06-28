//
//  Word.swift
//  WordList
//
//  Created by 大森青 on 2025/06/29.
//

import SwiftData

@Model
class Word {
    var english: String
    var japanese: String
    
    init(english: String, japanese: String) {
        self.english = english
        self.japanese = japanese
    }
}
