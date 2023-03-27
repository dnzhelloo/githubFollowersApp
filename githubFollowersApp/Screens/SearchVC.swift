//
//  SearchVC.swift
//  githubFollowersApp
//
//  Created by deniz on 26.03.2023.
//

import UIKit
import SwiftUI

class SearchVC: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextField()
    let callActionButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    var isUsernameEntered:Bool{
        return !(usernameTextField.text?.isEmpty  ?? true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureLogoImage()
        configureTextField()
        configureCallActionBtn()
        
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: dissmis Keyboard
    func createDismissKeyboardTapGesture(){
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: pushDataFollowerListVC
    @objc func pushFollowerListVC(){
        guard isUsernameEntered else {
            presentGFAlertOnMainThread(title: "The Username error 🫢", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mollis condimentum enim, ac vehicula orci elementum sed", btnTitle: "Ok")
            return
        }
            
        let followerListVC = FollowersListVC()
        followerListVC.title = usernameTextField.text ?? ""
        followerListVC.username = usernameTextField.text ?? ""
        
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    //MARK: Logo
    func configureLogoImage(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    //MARK: UsernameTextField
    func configureTextField(){
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    //MARK: Button
    func configureCallActionBtn(){
        view.addSubview(callActionButton)
        callActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            callActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            callActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            callActionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension SearchVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
