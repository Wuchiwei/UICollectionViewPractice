//
//  ViewController.swift
//  UICollectionViewPractice
//
//  Created by WU CHIH WEI on 2019/7/28.
//  Copyright © 2019 WU CHIH WEI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NTU", for: indexPath)
        
        guard let ntuCell = cell as? NTUCollectionViewCell else {
            return cell
        }
        
        ntuCell.label.text = "Section \(indexPath.section) Row \(indexPath.row)"
        
        return cell
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout
        
        guard let flowLayout = layout as? UICollectionViewFlowLayout else {
            
            return
        }
        
        flowLayout.scrollDirection = .vertical
        
        flowLayout.itemSize = CGSize(width: 200, height: 100)
        
    }


}

