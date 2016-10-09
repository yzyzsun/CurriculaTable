//
//  String+Truncate.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-11.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import Foundation

extension String {
    
    func truncated(_ length: Int) -> String {
        return substring(to: index(startIndex, offsetBy: length, limitedBy: endIndex) ?? endIndex)
    }
    
    mutating func truncate(_ length: Int) {
        self = truncated(length)
    }
    
}
