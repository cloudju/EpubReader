//
//  EpubFileManagement.swift
//  EpubReader
//
//  Created by 居朝強 on 2019/09/07.
//  Copyright © 2019 Cloudju. All rights reserved.
//

import Foundation

class EpubFileManagement {
    let doc = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    func getEpubs() -> [URL] {
        var epubs: [URL] = []
        let fs = FileManager.default
        let docPath = URL(fileURLWithPath: doc)
        if let files = try? fs.contentsOfDirectory(atPath: doc) {
            let names = NSArray(array: files).pathsMatchingExtensions(["epub"])
            for name in names {
                let path = docPath.appendingPathComponent(name)
                epubs.append(path)
            }
        }
        return epubs
    }
}
