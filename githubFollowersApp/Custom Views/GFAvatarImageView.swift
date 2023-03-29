//
//  GFAvatarImageView.swift
//  githubFollowersApp
//
//  Created by deniz on 29.03.2023.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeHolderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
