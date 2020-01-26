//
//  ViewController.swift
//  VA_SuperHeroes
//
//  Created by Vikash Anand on 30/10/19.
//  Copyright © 2019 Vikash Anand. All rights reserved.
//

import UIKit

class HeroesVC: UIViewController, SegueHandlerType {
    
    enum SegueIdentifier: String {
        case OfficalHomePage = "officalHomePage"
        case Detail = "detail"
    }
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            self.tableView.dataSource = self
            self.tableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Marvel Cinematic Universe"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifierForSegue(segue: segue) {
        case .OfficalHomePage:
            guard let sender = sender as? UIButton, let officialPageVC = segue.destination as? HeroOfficialPageViewController else { return }
            officialPageVC.urlString = HeroVM[sender.tag]
        case .Detail:
            guard let cell = sender as? HeroTableViewCell, let detailVC = segue.destination as? HeroDetailViewController else { return }
            let index = cell.infoButton.tag
            detailVC.urlString = HeroVM[index]
            detailVC.iconIdentifier = HeroVM.iconIdentifier(for: index)
            detailVC.name = HeroVM.name(for: index)
        }
    }
}

extension HeroesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        HeroVM.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = String(describing: HeroTableViewCell.self)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? HeroTableViewCell else {
            fatalError("Cell with given identifier not found...")
        }
        
        cell.imageTappedCompletionHandler = { sender in
            self.performSegueWithIdentifier(segueIdentifier: .OfficalHomePage, sender: sender)
        }
        
        cell.configiure(with: HeroVM.iconIdentifier(for: indexPath.row), and: HeroVM.name(for: indexPath.row), at: indexPath)
        return cell
    }
}

extension HeroesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension UIImage {
    convenience init!(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }
}
