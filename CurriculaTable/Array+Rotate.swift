//
//  Array+Rotate.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-10.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import Foundation

extension Array {
    
    func rotate(shiftingToStart middle: Index) -> Array {
        return Array(suffix(count - middle) + prefix(middle))
    }
    
    mutating func rotateInPlace(shiftingToStart middle: Index) {
        self = rotate(shiftingToStart: middle)
    }
    
}
