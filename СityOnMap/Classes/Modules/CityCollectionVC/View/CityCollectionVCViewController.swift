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
    var activityIndicator = ActivityIndicatorVC()
    let configurator = CityCollectionVCModuleConfigurator()
    var presenter: CityCollectionVCViewOutput!
    var dataArray: [City]?

    @IBOutlet weak var connectIndicator: UIImageView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.showActivityIndicator(view)
        
        connectIndicator.layer.borderColor   = UIColor.darkGray.cgColor
        connectIndicator.layer.cornerRadius  = connectIndicator.bounds.width / 2.0
        connectIndicator.layer.masksToBounds = true
        
        let nib = UINib(nibName: "CityCollectionCell", bundle: nil)
        self.collectionView?.register(nib, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        self.navigationItem.title = "City"
        configurator.configureModuleForViewInput(viewInput: self)
        notification()
        presenter.getData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
        if let data = dataArray {
            presenter.presentGoogleMapsVC(vc: self,
                                   longitude: data[indexPath.row].city_longitude,
                                    latitude: data[indexPath.row].city_latitude)
        }
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

extension CityCollectionVCViewController {
    func notification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(hideActivityIndicator),
                                               name: listenerActivityIndicatorNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(connectReachable),
                                               name: listenerNetworkReachableNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(connectNotReachable),
                                               name: listenerNetworkNotReachableNotification,
                                               object: nil)
    }
}

extension CityCollectionVCViewController {
    func hideActivityIndicator() {
        activityIndicator.hideProgressView()
    }
    
    func connectReachable() {
        connectIndicator.backgroundColor = .green
    }
    
    func connectNotReachable() {
        connectIndicator.backgroundColor = .red
    }
}






































