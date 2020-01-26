//
//  HeroTableViewCell.swift
//  VA_SuperHeroes
//
//  Created by Vikash Anand on 30/10/19.
//  Copyright © 2019 Vikash Anand. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    var imageTappedCompletionHandler:((UIButton) -> (Void))?
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var infoButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupIconView()
    }
    
    private func setupIconView() {
        
        self.iconImageView.backgroundColor = UIColor.white
        self.iconImageView.layer.cornerRadius = self.iconImageView.bounds.width / 2.0
        self.iconImageView.layer.borderColor = UIColor.systemIndigo.cgColor
        self.iconImageView.layer.borderWidth = 2.0
        self.iconImageView.isUserInteractionEnabled = true
        self.iconImageView.clipsToBounds = true
        
        let button = UIButton()
        button.addTarget(self, action: #selector(handleAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.iconImageView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.iconImageView.leadingAnchor),
            button.topAnchor.constraint(equalTo: self.iconImageView.topAnchor),
            self.iconImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor),
            self.iconImageView.bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])
    }
    
    @objc func handleAction(_ sender: UIButton) {
        self.imageTappedCompletionHandler?(sender)
    }
    
    func configiure(with iconIdentifier: AssetIdentifier, and name: String, at indexPath: IndexPath) {
        self.iconImageView.image = UIImage(named: iconIdentifier.rawValue)
        self.nameLabel.text = name
        self.infoButton.tag = indexPath.row
        self.iconImageView.tag = indexPath.row
    }
}
