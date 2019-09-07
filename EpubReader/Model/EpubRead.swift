//
//  EpubRead.swift
//  EpubReader
//
//  Created by 居朝強 on 2019/09/07.
//  Copyright © 2019 Cloudju. All rights reserved.
//

import Foundation
import EPUBKit

class EpubRead {
    
    private let path: URL
    private let epub: EPUBDocument
    private var category: [URL] = []
    
    init?(_ filePath: URL) {
        self.path = filePath
        guard let epub = EPUBDocument(url: self.path) else {
            return nil
        }
        self.epub = epub
        self.open()
    }
    
    private func open() {
        let fs = FileManager.default
        if let files = try? fs.contentsOfDirectory(atPath: epub.contentDirectory.path) {
            let htmls = NSArray(array: files).pathsMatchingExtensions(["html"])
            for html in htmls {
                let title = epub.contentDirectory.appendingPathComponent(html)
                category.append(title)
            }
        }
    }
    
    func getCategory()->[URL] {
        return category
    }
    
    func getData(cap: Int) -> NSAttributedString {
        let def = NSAttributedString()
        guard let html = try? String(contentsOf: category[cap]) else {return def}
        guard let txt = html.htmlToAttributedString else {return def}
        
        return txt       
    }
    
    func disp(_ path : URL) {
        if let html = try? String(contentsOf: path) {
            guard let txt = html.htmlToAttributedString else{ return }
            
            let r = NSRange(location: 0, length: txt.length)
            let str = NSMutableAttributedString()
            txt.enumerateAttributes(
                in: r,
                options: .longestEffectiveRangeNotRequired,
                using:  {a,b,c in
                    var attr = a
                    let font = attr[.font] as! UIFont
                    
                    print(font.pointSize + 5)
                    //str.replaceCharacters(in: b, with: a)
            })
            
            //txtView.attributedText = txt
            
        }
        //self.view.addSubview(txtView)
    }
}
