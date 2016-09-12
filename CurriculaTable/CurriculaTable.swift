//
//  CurriculaTable.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-10.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import UIKit

public class CurriculaTable: UIView {
    
    private let controller = CurriculaTableController()
    private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    public var weekdaySymbolType = CurriculaTableWeekdaySymbolType.Short {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public var firstWeekday = CurriculaTableWeekday.Monday {
        didSet {
            collectionView.reloadData()
            drawCurricula()
        }
    }
    
    public var numberOfPeriods = 13 {
        didSet {
            collectionView.reloadData()
            drawCurricula()
        }
    }
    
    public var curricula = [CurriculaTableItem]() {
        didSet {
            drawCurricula()
        }
    }
    
    public var bgColor = UIColor.clearColor() {
        didSet {
            collectionView.backgroundColor = bgColor
        }
    }
    
    public var symbolsBgColor = UIColor.clearColor() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public var symbolsFontSize = CGFloat(14) {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public var heightOfWeekdaySymbols = CGFloat(28) {
        didSet {
            collectionView.reloadData()
            drawCurricula()
        }
    }
    
    public var widthOfPeriodSymbols = CGFloat(32) {
        didSet {
            collectionView.reloadData()
            drawCurricula()
        }
    }
    
    public var borderWidth = CGFloat(0) {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public var borderColor = UIColor.clearColor() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    public var cornerRadius = CGFloat(0) {
        didSet {
            drawCurricula()
        }
    }
    
    public var textEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2) {
        didSet {
            drawCurricula()
        }
    }
    
    public var textFontSize = CGFloat(11) {
        didSet {
            drawCurricula()
        }
    }
    
    public var textAlignment = NSTextAlignment.Left {
        didSet {
            drawCurricula()
        }
    }
    
    public var maximumNameLength = 12 {
        didSet {
            drawCurricula()
        }
    }
    
    var weekdaySymbols: [String] {
        var weekdaySymbols = [String]()
        
        let calendar = NSCalendar.currentCalendar()
        switch weekdaySymbolType {
        case .Normal:
            weekdaySymbols = calendar.standaloneWeekdaySymbols
        case .Short:
            weekdaySymbols = calendar.shortStandaloneWeekdaySymbols
        case .VeryShort:
            weekdaySymbols = calendar.veryShortStandaloneWeekdaySymbols
        }
        let firstWeekdayIndex = firstWeekday.rawValue - 1
        weekdaySymbols.rotateInPlace(shiftingToStart: firstWeekdayIndex)
        
        return weekdaySymbols
    }
    
    var averageHeight: CGFloat {
        return (collectionView.frame.height - heightOfWeekdaySymbols) / CGFloat(numberOfPeriods)
    }
    
    var averageWidth: CGFloat {
        return (collectionView.frame.width - widthOfPeriodSymbols) / 7
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        controller.curriculaTable = self
        controller.collectionView = collectionView
        
        collectionView.dataSource = controller
        collectionView.delegate = controller
        collectionView.backgroundColor = bgColor
        addSubview(collectionView)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = bounds
        drawCurricula()
    }
    
    private func drawCurricula() {
        for subview in subviews {
            if !(subview is UICollectionView) {
                subview.removeFromSuperview()
            }
        }
        for (index, curriculum) in curricula.enumerate() {
            let weekdayIndex = (curriculum.weekday.rawValue - firstWeekday.rawValue + 7) % 7
            let x = widthOfPeriodSymbols + averageWidth * CGFloat(weekdayIndex)
            let y = heightOfWeekdaySymbols + averageHeight * CGFloat(curriculum.startPeriod - 1)
            let height = averageHeight * CGFloat(curriculum.endPeriod - curriculum.startPeriod + 1)
            let view = UIView(frame: CGRect(x: x, y: y, width: averageWidth, height: height))
            view.backgroundColor = curriculum.bgColor
            view.layer.cornerRadius = cornerRadius
            view.layer.masksToBounds = true
            
            let label = UILabel(frame: CGRect(x: textEdgeInsets.left, y: textEdgeInsets.top, width: view.frame.width - textEdgeInsets.left - textEdgeInsets.right, height: view.frame.height - textEdgeInsets.top - textEdgeInsets.bottom))
            let truncatedName = curriculum.name.truncate(maximumNameLength)
            let attrStr = NSMutableAttributedString(string: truncatedName + "\n\n" + curriculum.place, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(textFontSize)])
            attrStr.setAttributes([NSFontAttributeName: UIFont.boldSystemFontOfSize(textFontSize)], range: NSRange(0..<truncatedName.characters.count))
            label.attributedText = attrStr
            label.textColor = curriculum.textColor
            label.textAlignment = textAlignment
            label.numberOfLines = 0
            label.tag = index
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(curriculumTapped)))
            label.userInteractionEnabled = true
            
            view.addSubview(label)
            addSubview(view)
        }
    }
    
    func curriculumTapped(sender: UITapGestureRecognizer) {
        let curriculum = curricula[(sender.view as! UILabel).tag]
        curriculum.tapHandler(curriculum)
    }
    
}
