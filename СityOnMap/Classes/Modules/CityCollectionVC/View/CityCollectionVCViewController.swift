//
//  CityCollectionVC
//  CityCollectionVCViewController.swift
//  СityOnMap
//
//  Created by Samsonov Pavel on 01/04/2017.
//  Copyright © 2017 Pavel Samsonov. All rights reserved.
//

import UIKit

private let cellReuseIdentifier = "Cell"

class CityCollectionVCViewController: UICollectionViewController {
    let configurator = CityCollectionVCModuleConfigurator()
    var presenter: CityCollectionVCViewOutput!
    var dataArray: [City]?

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "CityCollectionCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        self.navigationItem.title = "City"
        
        configurator.configureModuleForViewInput(viewInput: self)
        
        presenter.getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension CityCollectionVCViewController: CityCollectionVCViewInput {
    func reloadCollectionVC(cities: [City]?) {
        if let data = cities {
            dataArray = data
        }
        collectionView?.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension CityCollectionVCViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let data = dataArray {
            return data.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CityCollectionCell
        
        if let city = dataArray?[indexPath.row] {
            cell.textLabel.text = city.city_name
            cell.imageView.image = imageFromId(id: city.city_id!)
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension CityCollectionVCViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

// MARK: UICollectionViewDelegateFlowLayout

fileprivate let item: CGFloat = 10
fileprivate let itemsPerRow: CGFloat = 2.0
fileprivate let sectionInsets = UIEdgeInsets(top: item, left: item, bottom: item, right: item)

extension CityCollectionVCViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width / itemsPerRow 
        let widthPerItem = width + (width / itemsPerRow) * itemsPerRow
        
        var deltaY: CGFloat = widthPerItem / (item * 2.0)
        if view.frame.width != 320.0 { deltaY = -(item * 4.0) }
        let heightPerItem = widthPerItem + deltaY
        
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.top
    }
}







































