//
//  AttributedString.swift
//  EpubReader
//
//  Created by 居朝強 on 2019/09/07.
//  Copyright © 2019 Cloudju. All rights reserved.
//

import Foundation
import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            let opts: [NSAttributedString.DocumentReadingOptionKey : Any] = [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding:String.Encoding.utf8.rawValue
            ]
            
            return try NSAttributedString(data: data,
                                          options: opts,
                                          documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
