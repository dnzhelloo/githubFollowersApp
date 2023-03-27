//
//  UIViewController+Ext.swift
//  githubFollowersApp
//
//  Created by deniz on 27.03.2023.
//


import UIKit

extension UIViewController{
    
    func presentGFAlertOnMainThread(title:String,message:String,btnTitle:String){
        DispatchQueue.main.async {
            let alertVC = AlertVC(alertTitle: title, message: message, button: btnTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
