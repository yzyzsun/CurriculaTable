//
//  CurriculaTableController.swift
//  CurriculaTable
//
//  Created by Sun Yaozhu on 2016-09-10.
//  Copyright © 2016 Sun Yaozhu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CurriculaTableController: UIViewController {
    
    var curriculaTable: CurriculaTable!
    
    var collectionView: UICollectionView! {
        didSet {
            collectionView.registerClass(CurriculaTableCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
}

extension CurriculaTableController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (curriculaTable.numberOfPeriods + 1) * 8
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CurriculaTableCell
        cell.backgroundColor = curriculaTable.symbolsBgColor
        cell.layer.borderWidth = curriculaTable.borderWidth
        cell.layer.borderColor = curriculaTable.borderColor.CGColor
        cell.textLabel.font = UIFont.systemFontOfSize(curriculaTable.symbolsFontSize)
        if indexPath.row == 0 {
            cell.textLabel.text = ""
        } else if indexPath.row < 8 {
            cell.textLabel.text = curriculaTable.weekdaySymbols[indexPath.row - 1]
        } else if indexPath.row % 8 == 0 {
            cell.textLabel.text = String(indexPath.row / 8)
        } else {
            cell.textLabel.text = ""
            cell.backgroundColor = UIColor.clearColor()
        }
        return cell
    }
    
}

extension CurriculaTableController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: curriculaTable.widthOfPeriodSymbols, height: curriculaTable.heightOfWeekdaySymbols)
        } else if indexPath.row < 8 {
            return CGSize(width: curriculaTable.averageWidth, height: curriculaTable.heightOfWeekdaySymbols)
        } else if indexPath.row % 8 == 0 {
            return CGSize(width: curriculaTable.widthOfPeriodSymbols, height: curriculaTable.averageHeight)
        } else {
            return CGSize(width: curriculaTable.averageWidth, height: curriculaTable.averageHeight)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
}
