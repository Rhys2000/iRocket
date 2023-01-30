//
//  VesselDetailViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/17/23.
//

import UIKit

class ReadMoreGestureRecognizer: UITapGestureRecognizer {
    var vesselDescription: [String]?
}

class VesselDetailViewController: UIViewController {
    
    static let identifier = "VesselDetailViewController"
    
    var currentVessel = Vessel(name: "", abbreviation: "", formerNames: [""], idNumber: 0, owner: "", ownerWebsite: "", employerName: "", employerWebsite: "", originalVesselPurpose: .Default, currentVesselPurpose: [.Default], countryRegistration: .Default, homePort: "", homePortCoordinates: [0], yearBuilt: 0, hullDimensions: [0], serviceYears: [0], status: .Default, photographerCredit: "", marineFleetLink: "", description: [""])
    
    private let scrollView = UIScrollView()
    
    private let imageView = UIImageView()
    
    private let aboutTitle = UILabel()
    private let aboutText = UILabel()
    private let aboutButton = UILabel()
    private let aboutButtonImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentVessel.name
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        
        scrollView.backgroundColor = .gray
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
        imageView.image = UIImage(named: currentVessel.name.replacingOccurrences(of: " ", with: ""))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 5.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.frame = CGRect(x: 10, y: 0, width: view.frame.width - 20, height: 200)
        scrollView.addSubview(imageView)
        
        aboutTitle.text = "About \((currentVessel.abbreviation != "" ? currentVessel.abbreviation : currentVessel.name))"
        aboutTitle.font = .boldSystemFont(ofSize: 24)
        aboutTitle.textColor = .white
        aboutTitle.sizeToFit()
        aboutTitle.textAlignment = .center
        aboutTitle.frame = CGRect(x: 10, y: imageView.frame.maxY + 5, width: view.frame.width - 20, height: aboutTitle.frame.height)
        scrollView.addSubview(aboutTitle)
        
        aboutText.text = "\t\(currentVessel.description[0])\n\n\t\(currentVessel.description[1])"
        aboutText.font = .boldSystemFont(ofSize: aboutText.font.pointSize)
        aboutText.backgroundColor = .gray
        aboutText.textColor = .white
        aboutText.numberOfLines = 0
        aboutText.textAlignment = .justified
        aboutText.frame.origin = CGPoint(x: 20, y: aboutTitle.frame.maxY + 5)
        aboutText.frame.size = updateFrameUsingBackgroundView(for: aboutText, using: scrollView)
        scrollView.addSubview(aboutText)
        
        aboutButton.text = " 📖  Read More  "
        aboutButton.font = .boldSystemFont(ofSize: 20)
        aboutButton.textColor = .white
        aboutButton.isUserInteractionEnabled = true
        aboutButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushVesselAboutViewController)))
        aboutButton.sizeToFit()
        aboutButton.textAlignment = .center
        aboutText.baselineAdjustment = .alignCenters
        aboutButton.layer.cornerRadius = 10.0
        aboutButton.layer.masksToBounds = true
        aboutButton.layer.borderWidth = 2.0
        aboutButton.layer.borderColor = UIColor.white.cgColor
        aboutButton.frame.origin = CGPoint(x: (view.frame.width - aboutButton.frame.width) / 2, y: aboutText.frame.maxY + 10)
        aboutButton.frame.size.height = CGFloat(aboutButton.frame.height + 10)
        scrollView.addSubview(aboutButton)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 2000)
        
    }
    
    @objc func pushVesselAboutViewController() {
        let viewController = storyboard?.instantiateViewController(withIdentifier: VesselDetailAboutViewController.controllerIdentifier) as? VesselDetailAboutViewController
        viewController?.vesselName = currentVessel.name
        viewController?.vesselDescription = currentVessel.description
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func updateFrameUsingBackgroundView(for label: UILabel, using view: UIView) -> CGSize {
        let maxSize = CGSize(width: view.bounds.width - 40, height: 1000)
        return label.sizeThatFits(maxSize)
    }
    
}
