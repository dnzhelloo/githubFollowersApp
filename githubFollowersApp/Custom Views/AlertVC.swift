//
//  AlertVC.swift
//  githubFollowersApp
//
//  Created by deniz on 27.03.2023.
//

import UIKit

class AlertVC: UIViewController {

    let containerView = UIView()
    let alertTitleLabel = GFTitleLabel(textAlignment: .center, fontSize: 18)
    let alertBodyLabel = GFBodyLabel(textAlignment: .center)
    let actionButton  = GFButton(backgroundColor: .systemPink, title: "OK")
    
    var alertTitle:String?
    var bodyMessage:String?
    var buttonTitle:String?
    
    let padding:CGFloat = 20
    
    init(alertTitle:String?,message:String?,button:String?) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = alertTitle
        self.bodyMessage = message
        self.buttonTitle = button
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha:0.75)
        
        configureContainerView()
        configureTitleLabel()
        configureButton()
        configureBodyLabel()
        
    }
    
    //MARK: objc button
    @objc func dissmisVC(){
        dismiss(animated: true)
    }
    
    //MARK: containerView
    func configureContainerView(){
        view.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 2
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    //MARK: title Label
    func configureTitleLabel(){
        containerView.addSubview(alertTitleLabel)
        alertTitleLabel.text = alertTitle ?? "Something went wrong"
        
        NSLayoutConstraint.activate([
            alertTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,constant: padding),
            alertTitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            alertTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            alertTitleLabel.heightAnchor.constraint(equalToConstant: 28)
            
        ])
    }
    
    //MARK: button
    func configureButton(){
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(dissmisVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,constant: -padding),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    //MARK: configureBodyLabel
    func configureBodyLabel(){
        containerView.addSubview(alertBodyLabel)
        alertBodyLabel.text = bodyMessage ?? "unable to complete request"
        alertBodyLabel.numberOfLines = 4
        
        NSLayoutConstraint.activate([
            alertBodyLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor,constant: 8),
            alertBodyLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: padding),
            alertBodyLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor,constant: -padding),
            alertBodyLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor,constant: -12)
        ])
    }
}
