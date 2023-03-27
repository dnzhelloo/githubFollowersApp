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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}
