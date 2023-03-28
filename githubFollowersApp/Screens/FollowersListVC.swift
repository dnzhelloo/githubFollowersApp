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
        
        NetworkManager.shared.getFollowers(for: username ?? "", page: 1) { followers, errorMesage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad stuff happened", message: errorMesage?.rawValue ?? "", btnTitle: "Ok")
                return
            }
            print(followers)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
