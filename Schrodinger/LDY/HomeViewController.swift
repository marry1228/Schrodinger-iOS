//
//  HomeViewController.swift
//  Schrodinger
//
//  Created by ido on 2021/07/29.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var firstSectionTitle: UILabel!
    @IBOutlet weak var secondSectionTitle: UILabel!
    @IBOutlet weak var thirdSectionTitle: UILabel!
    @IBOutlet weak var fourthSectionTitle: UILabel!
    @IBOutlet weak var checkTodayButton: UIButton!
    @IBOutlet weak var expiredItemCollectionView: UICollectionView!
    @IBOutlet weak var upcomingExpireCollectionView: UICollectionView!
    
    func applyLabel() {
        firstSectionTitle.text = "Today expired item..".localized
        secondSectionTitle.text = "Expired item".localized
        thirdSectionTitle.text = "Upcoming expire".localized
        fourthSectionTitle.text = "My History".localized
    }
    
    func applyButton() {
        checkTodayButton.setTitle("Check".localized, for: .normal)
        checkTodayButton.addTarget(self, action: #selector(showTodayExpiredList), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyLabel()
        applyButton()
        expiredItemCollectionView.delegate = self
        expiredItemCollectionView.dataSource = self
        upcomingExpireCollectionView.delegate = self
        upcomingExpireCollectionView.dataSource = self
       
    }
    
    @objc func showTodayExpiredList() {
        //TODO: Apply push today expired list
        
        //Testing Method
        let storyboard = UIStoryboard(name: "DyLee", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "WorldViewController")
        present(destinationVC, animated: true, completion: nil)
    }
   
}

//MARK: MOVE TO DETAIL
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOfHomeView", for: indexPath) as? CellOfHomeView else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
}

class CellOfHomeView: UICollectionViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    
}
