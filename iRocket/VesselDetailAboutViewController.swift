//
//  VesselDetailAboutViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/30/23.
//

import UIKit

class VesselDetailAboutViewController: UIViewController {
    
    static let controllerIdentifier = "VesselDetailAboutViewController"
    
    var vesselName = String()
    var vesselDescription = [String]()
    
    private let scrollView = UIScrollView()
    
    private let informationLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "About \(vesselName)"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        scrollView.backgroundColor = .gray
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
        informationLabel.text = "\t"
        for paragraph in vesselDescription {
            if(paragraph != vesselDescription.last) {
                informationLabel.text! += "\(paragraph) \n\n\t"
            } else {
                informationLabel.text! += "\(paragraph)"
            }
        }
        informationLabel.textColor = .white
        informationLabel.backgroundColor = .lightGray
        informationLabel.textAlignment = .justified
        informationLabel.numberOfLines = 0
        informationLabel.frame.origin = CGPoint(x: 20, y: 10)
        informationLabel.layer.cornerRadius = 10.0
        informationLabel.layer.masksToBounds = true
        informationLabel.frame.size = updateFrameUsingBackgroundView(for: informationLabel, using: scrollView)
        scrollView.addSubview(informationLabel)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: informationLabel.frame.maxY + 10)
    }
    
    func updateFrameUsingBackgroundView(for label: UILabel, using view: UIView) -> CGSize {
        let maxSize = CGSize(width: view.bounds.width - 40, height: 2000)
        return label.sizeThatFits(maxSize)
    }
    
}
