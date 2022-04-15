//
//  CollectionViewController.swift
//  CFL Viewer
//
//  Created by Denny on 10.04.2022.
//

import UIKit

protocol ChipsCollectionVCDelegate: AnyObject {
    func slectedYear(year: String?)
}

class ChipsCollectionVC: UICollectionViewController {
    
    let years = ["2015", "2016", "2017", "2018", "2019", "2020", "2021"]
    
    weak var chipDelegate: ChipsCollectionVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(ChipCell.self, forCellWithReuseIdentifier: ChipCell.reuseID)
    }
}

// MARK: - UICollectionViewDataSource
extension ChipsCollectionVC {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return years.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChipCell.reuseID, for: indexPath) as! ChipCell
        cell.set(year: years[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ChipCell {
            chipDelegate?.slectedYear(year: cell.yearLabel.text)
            cell.status = true
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ChipCell {
            cell.status = false
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ChipsCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 50)
    }
}
