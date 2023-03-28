//
//  FollowersListVC.swift
//  githubFollowersApp
//
//  Created by deniz on 27.03.2023.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username ?? "", page: 1) { result in
            
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happaned", message: error.rawValue, btnTitle: "Ok")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
