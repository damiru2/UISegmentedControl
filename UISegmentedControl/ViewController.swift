//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Damir Chalkarov on 16.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heroImageView: UIImageView!
    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let heroes = ["naruto", "sasuke", "itachi", "madara", "obito"]
        segmentedControl = UISegmentedControl(items: heroes)
        
        heroImageView.contentMode = .scaleAspectFill
        
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 15)!,
                                                 NSAttributedString.Key.foregroundColor: UIColor.lightGray], for: .normal)
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Arial", size: 18)!,
                                                 NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedAction(sender:)), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 55),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.heightAnchor.constraint(equalToConstant: 48)])
        
    }
    
    @objc func segmentedAction(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: changeHero(for: "naruto")
        case 1: changeHero(for: "sasuke")
        case 2: changeHero(for: "itachi")
        case 3: changeHero(for: "madara")
        case 4: changeHero(for: "obito")
        default: break
        }
    }
    
    func changeHero(for index: String) {
        UIView.animate(withDuration: 0.5) {
            self.heroImageView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.heroImageView.alpha = 1
                self.heroImageView.image = UIImage(named: "\(index)")!
        }

        }
    }
    
}

