//
//  HeroDetailViewController.swift
//  VA_SuperHeroes
//
//  Created by Vikash Anand on 30/10/19.
//  Copyright © 2019 Vikash Anand. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController {

    var iconIdentifier: AssetIdentifier?
    var name: String?
    var urlString: String?
    
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let iconIdentifier = self.iconIdentifier {
            self.iconImageView.image = UIImage(named: iconIdentifier.rawValue)
        }
        
        if let name = self.name {
            self.nameLabel.text = name
        }
    }
}


