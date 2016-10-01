//
//  ViewController.swift
//  CurriculaTableDemo
//
//  Created by Sun Yaozhu on 2016-09-10.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import UIKit
import CurriculaTable

class ViewController: UIViewController {
    
    @IBOutlet weak var curriculaTable: CurriculaTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let handler = { (curriculum: CurriculaTableItem) in
            print(curriculum.name)
        }
        
        let infoSecA = CurriculaTableItem(name: "信息安全原理", place: "紫金港西1-303", weekday: .Monday, startPeriod: 1, endPeriod: 2, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.73, blue: 0.0, alpha: 1.0), identifier: "(2015-2016-2)-21190850", tapHandler: handler)
        let infoSecB = CurriculaTableItem(name: "信息安全原理", place: "紫金港西1-303", weekday: .Wednesday, startPeriod: 9, endPeriod: 10, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.73, blue: 0.0, alpha: 1.0), identifier: "(2015-2016-2)-21190850", tapHandler: handler)
        
        let databaseA = CurriculaTableItem(name: "数据库系统", place: "紫金港西2-214", weekday: .Tuesday, startPeriod: 3, endPeriod: 5, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.0, green: 0.83, blue: 0.62, alpha: 1.0), identifier: "(2015-2016-2)-21121350", tapHandler: handler)
        let databaseB = CurriculaTableItem(name: "数据库系统", place: "紫金港机房", weekday: .Friday, startPeriod: 1, endPeriod: 2, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.0, green: 0.83, blue: 0.62, alpha: 1.0), identifier: "(2015-2016-2)-21121350", tapHandler: handler)
        
        let comOrgA = CurriculaTableItem(name: "计算机组成", place: "紫金港西1-505", weekday: .Monday, startPeriod: 3, endPeriod: 5, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.78, green: 0.49, blue: 0.87, alpha: 1.0), identifier: "(2015-2016-2)-21186033", tapHandler: handler)
        let comOrgB = CurriculaTableItem(name: "计算机组成", place: "紫金港东4-509", weekday: .Wednesday, startPeriod: 11, endPeriod: 12, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.78, green: 0.49, blue: 0.87, alpha: 1.0), identifier: "(2015-2016-2)-21186033", tapHandler: handler)
        
        let dataStructureA = CurriculaTableItem(name: "高级数据结构与算法分析", place: "紫金港西2-415", weekday: .Tuesday, startPeriod: 6, endPeriod: 8, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.52, blue: 0.11, alpha: 1.0), identifier: "(2015-2016-2)-21120491", tapHandler: handler)
        let dataStructureB = CurriculaTableItem(name: "高级数据结构与算法分析", place: "紫金港机房", weekday: .Thursday, startPeriod: 3, endPeriod: 4, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.52, blue: 0.11, alpha: 1.0), identifier: "(2015-2016-2)-21120491", tapHandler: handler)
        
        let paraAlgoA = CurriculaTableItem(name: "并行算法", place: "紫金港西1-203", weekday: .Saturday, startPeriod: 2, endPeriod: 5, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.42, green: 0.60, blue: 0.98, alpha: 1.0), identifier: "(2015-2016-2)-21191790", tapHandler: handler)
        let paraAlgoB = CurriculaTableItem(name: "并行算法", place: "紫金港西1-203", weekday: .Saturday, startPeriod: 6, endPeriod: 9, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.42, green: 0.60, blue: 0.98, alpha: 1.0), identifier: "(2015-2016-2)-21191790", tapHandler: handler)
        
        let maoismA = CurriculaTableItem(name: "毛泽东思想和中国特色社会主义理论体系概论", place: "紫金港西1-216", weekday: .Wednesday, startPeriod: 1, endPeriod: 2, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.43, blue: 0.51, alpha: 1.0), identifier: "(2015-2016-2)-031E0031", tapHandler: handler)
        let maoismB = CurriculaTableItem(name: "毛泽东思想和中国特色社会主义理论体系概论", place: "紫金港西1-216", weekday: .Friday, startPeriod: 3, endPeriod: 5, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 1.0, green: 0.43, blue: 0.51, alpha: 1.0), identifier: "(2015-2016-2)-031E0031", tapHandler: handler)
        
        let nihongoA = CurriculaTableItem(name: "日语 IV", place: "紫金港东1A-204", weekday: .Tuesday, startPeriod: 9, endPeriod: 10, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.0, green: 0.69, blue: 0.95, alpha: 1.0), identifier: "(2015-2016-2)-051F0090", tapHandler: handler)
        let nihongoB = CurriculaTableItem(name: "日语 IV", place: "紫金港东1A-204", weekday: .Thursday, startPeriod: 9, endPeriod: 10, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.0, green: 0.69, blue: 0.95, alpha: 1.0), identifier: "(2015-2016-2)-051F0090", tapHandler: handler)
        
        let radio = CurriculaTableItem(name: "无线电测向（初级班）", place: "紫金港东田径场", weekday: .Thursday, startPeriod: 6, endPeriod: 7, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.96, green: 0.38, blue: 0.76, alpha: 1.0), identifier: "(2015-2016-2)-40103200", tapHandler: handler)
        
        let asianEco = CurriculaTableItem(name: "亚洲经济发展", place: "紫金港西1-208", weekday: .Monday, startPeriod: 11, endPeriod: 13, textColor: UIColor.whiteColor(), bgColor: UIColor(red: 0.46, green: 0.82, blue: 0.0, alpha: 1.0), identifier: "(2015-2016-2)-241H0020", tapHandler: handler)
        
        curriculaTable.curricula = [infoSecA, infoSecB, databaseA, databaseB, comOrgA, comOrgB, dataStructureA, dataStructureB, paraAlgoA, paraAlgoB, maoismA, maoismB, nihongoA, nihongoB, radio, asianEco]
        
        curriculaTable.bgColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        curriculaTable.borderWidth = 0.5
        curriculaTable.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        curriculaTable.cornerRadius = 5
        curriculaTable.maximumNameLength = 12
    }
    
}
