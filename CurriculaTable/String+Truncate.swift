//
//  String+Truncate.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-11.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import Foundation

extension String {
    
    func truncate(length: Int) -> String {
        return substringToIndex(startIndex.advancedBy(length, limit: endIndex))
    }
    
}
