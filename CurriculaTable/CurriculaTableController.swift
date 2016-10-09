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
            collectionView.register(CurriculaTableCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
}

extension CurriculaTableController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (curriculaTable.numberOfPeriods + 1) * 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CurriculaTableCell
        cell.backgroundColor = curriculaTable.symbolsBgColor
        cell.layer.borderWidth = curriculaTable.borderWidth
        cell.layer.borderColor = curriculaTable.borderColor.cgColor
        cell.textLabel.font = UIFont.systemFont(ofSize: curriculaTable.symbolsFontSize)
        if indexPath.row == 0 {
            cell.textLabel.text = ""
        } else if indexPath.row < 8 {
            cell.textLabel.text = curriculaTable.weekdaySymbols[indexPath.row - 1]
        } else if indexPath.row % 8 == 0 {
            cell.textLabel.text = String(indexPath.row / 8)
        } else {
            cell.textLabel.text = ""
            cell.backgroundColor = UIColor.clear
        }
        return cell
    }
    
}

extension CurriculaTableController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
