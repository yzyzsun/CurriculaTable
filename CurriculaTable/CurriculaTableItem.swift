//
//  CurriculaTableItem.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-10.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import Foundation

public struct CurriculaTableItem {
    
    public let name: String
    public let place: String
    public let weekday: CurriculaTableWeekday
    public let startPeriod: Int
    public let endPeriod: Int
    public let textColor: UIColor
    public let bgColor: UIColor
    public let identifier: String
    public let tapHandler: (CurriculaTableItem) -> Void
    
    public init(name: String, place: String, weekday: CurriculaTableWeekday, startPeriod: Int, endPeriod: Int, textColor: UIColor, bgColor: UIColor, identifier: String, tapHandler: @escaping (CurriculaTableItem) -> Void) {
        self.name = name
        self.place = place
        self.weekday = weekday
        self.startPeriod = startPeriod
        self.endPeriod = endPeriod
        self.textColor = textColor
        self.bgColor = bgColor
        self.identifier = identifier
        self.tapHandler = tapHandler
    }
    
}
