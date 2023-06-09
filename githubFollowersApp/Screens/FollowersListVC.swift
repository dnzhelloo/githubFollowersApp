//
//  FollowersListVC.swift
//  githubFollowersApp
//
//  Created by deniz on 27.03.2023.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username:String?
    var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        getFollowers()
        configureCollectionView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureViewController(){
        view.backgroundColor = .systemBackground
    }
    
    func getFollowers(){
        NetworkManager.shared.getFollowers(for: username ?? "", page: 1) { result in
            
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happaned", message: error.rawValue, btnTitle: "Ok")
            }
        }
    }
    
    func configureCollectionView(){
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createThreeCloumnFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemPink
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
    func createThreeCloumnFlowLayout()->UICollectionViewFlowLayout{
        let width = view.bounds.width
        let padding:CGFloat = 12
        let minimumItemSpacing:CGFloat = 10
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
}
