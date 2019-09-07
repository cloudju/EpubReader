//
//  EpubFileManagement.swift
//  EpubReader
//
//  Created by 居朝強 on 2019/09/07.
//  Copyright © 2019 Cloudju. All rights reserved.
//

import Foundation

class EpubFileManagement {
    let doc = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    
    func getEpubs() -> [String] {
        var epubs: [String] = []
        let fs = FileManager.default
        if let files = try? fs.contentsOfDirectory(atPath: doc[0]) {
            epubs = NSArray(array: files).pathsMatchingExtensions(["epub"])
        }
        return epubs
    }
}
