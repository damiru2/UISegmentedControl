//
//  ViewController.swift
//  UISegmentedControl
//
//  Created by Damir Chalkarov on 16.07.2022.
//

import UIKit

class ViewController: UIViewController {

    var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titles = ["one", "two", "three"]
        segmentedControl = UISegmentedControl(items: titles)
        
        segmentedControl.insertSegment(withTitle: "four", at: 3, animated: true)
        
        segmentedControl.setTitle("two2", forSegmentAt: 1)
        
        segmentedControl.setImage(UIImage(systemName: "circle"), forSegmentAt: 0)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = UIColor.red
//         segmentedControl.setWidth(150, forSegmentAt: 2)
        
        segmentedControl.setTitle("so long title text", forSegmentAt: 2)
        segmentedControl.apportionsSegmentWidthsByContent = true
        segmentedControl.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        
        
        
        view.addSubview(segmentedControl)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                                     segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)])
        
        
    }
    
    @objc func segmentAction(sender: UISegmentedControl) {
        print(sender.titleForSegment(at: sender.selectedSegmentIndex))
    }


}

