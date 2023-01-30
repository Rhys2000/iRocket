//
//  VesselDetailViewController.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/17/23.
//

import UIKit

class LinkTapGestureRecognizer: UITapGestureRecognizer {
    var link: String?
}

class VesselDetailViewController: UIViewController {
    
    static let identifier = "VesselDetailViewController"
    
    var currentVessel = Vessel(vesselName: "", abbreviation: "", formerNames: [""], idNumber: "", ownerName: "", ownerWebsite: "", operatorName: "", operatorWebsite: "", employerName: "", employerWebsite: "", vesselPurpose: [.Default], countryRegistration: .Default, homePort: "", homePortCoordinates: [0], yearBuilt: 0, hullDimensions: [0], serviceYears: [0], status: .Default, photographerCredit: "", marineFleetLink: "", description: [""])
    
    private let scrollView = UIScrollView()
    
    private let imageView = UIImageView()
    
    private let aboutTitle = UILabel()
    
    private let aboutText = UILabel()
    private let aboutButton = UILabel()
    private let aboutButtonImage = UIImageView()
    
    private let statisticsTitle = UILabel()
    
    private let nameLabel = UILabel()
    private let nameData = UILabel()
    
    private let formerNameLabel = UILabel()
    private let formerNameData = UILabel()
    
    private let purposeLabel = UILabel()
    private let purposeData = UILabel()
    
    private let ownerLabel = UILabel()
    private let ownerData = UILabel()
    
    private let operatorLabel = UILabel()
    private let operatorData = UILabel()
    
    private let employerLabel = UILabel()
    private let employerData = UILabel()
    
    private let yearBuiltLabel = UILabel()
    private let yearBuiltData = UILabel()
    
    private let dimensionLabel = UILabel()
    private let dimensionData = UILabel()
    
    private let homePortLabel = UILabel()
    private let homePortData = UILabel()
    
    private let identificationLabel = UILabel()
    private let identificationData = UILabel()
    
    private let serviceRecordLabel = UILabel()
    private let serviceRecordData = UILabel()
    
    private let statusLabel = UILabel()
    private let statusData = UILabel()
    
    private let marineFleetLabel = UILabel()
    private let marineFleetData = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = currentVessel.vesselName
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        
        tabBarController?.tabBar.backgroundColor = .white
        
        scrollView.backgroundColor = .gray
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        
        imageView.image = UIImage(named: currentVessel.vesselName.replacingOccurrences(of: " ", with: ""))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10.0
        imageView.layer.borderWidth = 5.0
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.frame = CGRect(x: 10, y: 0, width: view.frame.width - 20, height: 200)
        scrollView.addSubview(imageView)
        
        aboutTitle.text = "About \((currentVessel.abbreviation != "" ? currentVessel.abbreviation : currentVessel.vesselName))"
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
        
        statisticsTitle.text = "Vessel Statistics"
        statisticsTitle.font = .boldSystemFont(ofSize: 24)
        statisticsTitle.textColor = .white
        statisticsTitle.sizeToFit()
        statisticsTitle.textAlignment = .center
        statisticsTitle.frame = CGRect(x: 10, y: aboutButton.frame.maxY + 10, width: view.frame.width - 20, height: aboutTitle.frame.height)
        scrollView.addSubview(statisticsTitle)
        
        nameLabel.text = "Name: "
        nameLabel.font = .systemFont(ofSize: nameLabel.font.pointSize)
        nameLabel.sizeToFit()
        nameLabel.frame.origin = CGPoint(x: 20, y: statisticsTitle.frame.maxY + 5)
        scrollView.addSubview(nameLabel)
        
        nameData.text = "\(currentVessel.vesselName) \(currentVessel.abbreviation != "" ? "(\(currentVessel.abbreviation))" : "")"
        nameData.font = .boldSystemFont(ofSize: nameLabel.font.pointSize)
        nameData.textColor = .white
        nameData.sizeToFit()
        nameData.frame.origin = CGPoint(x: nameLabel.frame.maxX, y: nameLabel.frame.minY)
        scrollView.addSubview(nameData)
        
        formerNameLabel.text = "Former Name\(currentVessel.formerNames.count > 1 ? "s" : "" ): "
        formerNameLabel.font = .systemFont(ofSize: formerNameLabel.font.pointSize)
        formerNameLabel.sizeToFit()
        formerNameLabel.frame.origin = CGPoint(x: 20, y: nameLabel.frame.maxY + 5)
        scrollView.addSubview(formerNameLabel)
        
        formerNameData.text = ""
        if(currentVessel.formerNames.count == 2) {
            formerNameData.text = "\(currentVessel.formerNames[0]) and \(currentVessel.formerNames[1])"
        } else if (currentVessel.formerNames.count > 2) {
            for name in currentVessel.formerNames {
                if(name != currentVessel.formerNames.last) {
                    formerNameData.text! += "\(name), "
                } else {
                    formerNameData.text! += "and \(name)"
                }
            }
        } else {
            formerNameData.text = currentVessel.formerNames[0]
        }
        formerNameData.font = .boldSystemFont(ofSize: formerNameData.font.pointSize)
        formerNameData.textColor = .white
        formerNameData.sizeToFit()
        formerNameData.frame.origin = CGPoint(x: formerNameLabel.frame.maxX, y: formerNameLabel.frame.minY)
        scrollView.addSubview(formerNameData)
        
        purposeLabel.text = "Purpose: "
        purposeLabel.font = .systemFont(ofSize: purposeLabel.font.pointSize)
        purposeLabel.sizeToFit()
        purposeLabel.frame.origin = CGPoint(x: 20, y: formerNameLabel.frame.maxY + 5)
        scrollView.addSubview(purposeLabel)
        
        purposeData.text = ""
        if(currentVessel.vesselPurpose.count == 2) {
            purposeData.text = "\(currentVessel.vesselPurpose[0].decodeVesselPurpose()) and \(currentVessel.vesselPurpose[1].decodeVesselPurpose())"
        } else if (currentVessel.vesselPurpose.count > 2) {
            for purp in currentVessel.vesselPurpose {
                if(purp != currentVessel.vesselPurpose.last) {
                    purposeData.text! += "\(purp.decodeVesselPurpose()), "
                } else {
                    purposeData.text! += "and \(purp.decodeVesselPurpose())"
                }
            }
        } else {
            purposeData.text = currentVessel.vesselPurpose[0].decodeVesselPurpose()
        }
        purposeData.font = .boldSystemFont(ofSize: purposeData.font.pointSize)
        purposeData.textColor = .white
        purposeData.sizeToFit()
        purposeData.frame.origin = CGPoint(x: purposeLabel.frame.maxX, y: purposeLabel.frame.minY)
        scrollView.addSubview(purposeData)
        
        ownerLabel.text = "Owner: "
        ownerLabel.font = .systemFont(ofSize: ownerLabel.font.pointSize)
        ownerLabel.sizeToFit()
        ownerLabel.frame.origin = CGPoint(x: 20, y: purposeLabel.frame.maxY + 5)
        scrollView.addSubview(ownerLabel)
        
        ownerData.text = " \(currentVessel.ownerName) "
        ownerData.font = .boldSystemFont(ofSize: ownerData.font.pointSize)
        ownerData.textColor = .white
        ownerData.sizeToFit()
        ownerData.isUserInteractionEnabled = true
        let ownerLink = LinkTapGestureRecognizer(target: self, action: #selector(openLink(sender:)))
        ownerLink.link = currentVessel.ownerWebsite
        ownerData.addGestureRecognizer(ownerLink)
        ownerData.layer.cornerRadius = 10.0
        ownerData.layer.masksToBounds = true
        ownerData.layer.borderWidth = 1.0
        ownerData.layer.borderColor = UIColor.white.cgColor
        ownerData.frame.origin = CGPoint(x: ownerLabel.frame.maxX, y: ownerLabel.frame.minY)
        scrollView.addSubview(ownerData)
        
        operatorLabel.text = "Operator: "
        operatorLabel.font = .systemFont(ofSize: operatorLabel.font.pointSize)
        operatorLabel.sizeToFit()
        operatorLabel.frame.origin = CGPoint(x: 20, y: ownerLabel.frame.maxY + 5)
        scrollView.addSubview(operatorLabel)
        
        operatorData.text = " \(currentVessel.operatorName) "
        operatorData.font = .boldSystemFont(ofSize: operatorData.font.pointSize)
        operatorData.textColor = .white
        operatorData.sizeToFit()
        operatorData.isUserInteractionEnabled = true
        let operatorLink = LinkTapGestureRecognizer(target: self, action: #selector(openLink(sender:)))
        operatorLink.link = currentVessel.operatorWebsite
        operatorData.addGestureRecognizer(operatorLink)
        operatorData.layer.cornerRadius = 10.0
        operatorData.layer.masksToBounds = true
        operatorData.layer.borderWidth = 1.0
        operatorData.layer.borderColor = UIColor.white.cgColor
        operatorData.frame.origin = CGPoint(x: operatorLabel.frame.maxX, y: operatorLabel.frame.minY)
        scrollView.addSubview(operatorData)
        
        employerLabel.text = "Employer: "
        employerLabel.font = .systemFont(ofSize: employerLabel.font.pointSize)
        employerLabel.sizeToFit()
        employerLabel.frame.origin = CGPoint(x: 20, y: operatorLabel.frame.maxY + 5)
        scrollView.addSubview(employerLabel)
        
        employerData.text = " \(currentVessel.employerName) "
        employerData.font = .boldSystemFont(ofSize: employerData.font.pointSize)
        employerData.textColor = .white
        employerData.sizeToFit()
        employerData.isUserInteractionEnabled = true
        let employerLink = LinkTapGestureRecognizer(target: self, action: #selector(openLink(sender:)))
        employerLink.link = currentVessel.employerWebsite
        employerData.addGestureRecognizer(employerLink)
        employerData.layer.cornerRadius = 10.0
        employerData.layer.masksToBounds = true
        employerData.layer.borderWidth = 1.0
        employerData.layer.borderColor = UIColor.white.cgColor
        employerData.frame.origin = CGPoint(x: employerLabel.frame.maxX, y: employerLabel.frame.minY)
        scrollView.addSubview(employerData)
        
        yearBuiltLabel.text = "Year Built: "
        yearBuiltLabel.font = .systemFont(ofSize: yearBuiltLabel.font.pointSize)
        yearBuiltLabel.sizeToFit()
        yearBuiltLabel.frame.origin = CGPoint(x: 20, y: employerLabel.frame.maxY + 5)
        scrollView.addSubview(yearBuiltLabel)
        
        yearBuiltData.text = String(currentVessel.yearBuilt)
        yearBuiltData.font = .boldSystemFont(ofSize: yearBuiltData.font.pointSize)
        yearBuiltData.textColor = .white
        yearBuiltData.sizeToFit()
        yearBuiltData.frame.origin = CGPoint(x: yearBuiltLabel.frame.maxX, y: yearBuiltLabel.frame.minY)
        scrollView.addSubview(yearBuiltData)
        
        dimensionLabel.text = "Dimensions: "
        dimensionLabel.font = .systemFont(ofSize: dimensionLabel.font.pointSize)
        dimensionLabel.sizeToFit()
        dimensionLabel.frame.origin = CGPoint(x: 20, y: yearBuiltLabel.frame.maxY + 5)
        scrollView.addSubview(dimensionLabel)
        
        dimensionData.text = "\(currentVessel.hullDimensions[0])m wide x \(currentVessel.hullDimensions[1])m long"
        dimensionData.font = .boldSystemFont(ofSize: dimensionData.font.pointSize)
        dimensionData.textColor = .white
        dimensionData.sizeToFit()
        dimensionData.frame.origin = CGPoint(x: dimensionLabel.frame.maxX, y: dimensionLabel.frame.minY)
        scrollView.addSubview(dimensionData)
        
        homePortLabel.text = "Home Port: "
        homePortLabel.font = .systemFont(ofSize: homePortLabel.font.pointSize)
        homePortLabel.sizeToFit()
        homePortLabel.frame.origin = CGPoint(x: 20, y: dimensionLabel.frame.maxY + 5)
        scrollView.addSubview(homePortLabel)
        
        homePortData.text = "\(currentVessel.homePort), \(currentVessel.countryRegistration) \(currentVessel.countryRegistration.getFlagEmoji())"
        homePortData.font = .boldSystemFont(ofSize: homePortData.font.pointSize)
        homePortData.textColor = .white
        homePortData.sizeToFit()
        homePortData.frame.origin = CGPoint(x: homePortLabel.frame.maxX, y: homePortLabel.frame.minY)
        scrollView.addSubview(homePortData)
        
        identificationLabel.text = "\(currentVessel.idNumber.count == 7 ? "IMO" : "MMSI") Number: "
        identificationLabel.font = .systemFont(ofSize: identificationLabel.font.pointSize)
        identificationLabel.sizeToFit()
        identificationLabel.frame.origin = CGPoint(x: 20, y: homePortLabel.frame.maxY + 5)
        scrollView.addSubview(identificationLabel)
        
        identificationData.text = currentVessel.idNumber
        identificationData.font = .boldSystemFont(ofSize: dimensionData.font.pointSize)
        identificationData.textColor = .white
        identificationData.sizeToFit()
        identificationData.frame.origin = CGPoint(x: identificationLabel.frame.maxX, y: identificationLabel.frame.minY)
        scrollView.addSubview(identificationData)
        
        serviceRecordLabel.text = "Service Record: "
        serviceRecordLabel.font = .systemFont(ofSize: serviceRecordLabel.font.pointSize)
        serviceRecordLabel.sizeToFit()
        serviceRecordLabel.frame.origin = CGPoint(x: 20, y: identificationLabel.frame.maxY + 5)
        scrollView.addSubview(serviceRecordLabel)
        
        serviceRecordData.text = ""
        if(currentVessel.serviceYears[0] == currentVessel.serviceYears[1]) {
            serviceRecordData.text = String(currentVessel.serviceYears[0])
        } else {
            serviceRecordData.text = "\(currentVessel.serviceYears[0]) - \(currentVessel.serviceYears[1] == 0 ? "Present" : String(currentVessel.serviceYears[1]))"
        }
        serviceRecordData.font = .boldSystemFont(ofSize: dimensionData.font.pointSize)
        serviceRecordData.textColor = .white
        serviceRecordData.sizeToFit()
        serviceRecordData.frame.origin = CGPoint(x: serviceRecordLabel.frame.maxX, y: serviceRecordLabel.frame.minY)
        scrollView.addSubview(serviceRecordData)
        
        statusLabel.text = "Status: "
        statusLabel.font = .systemFont(ofSize: statusLabel.font.pointSize)
        statusLabel.sizeToFit()
        statusLabel.frame.origin = CGPoint(x: 20, y: serviceRecordLabel.frame.maxY + 5)
        scrollView.addSubview(statusLabel)
        
        statusData.text = " \(currentVessel.status.rawValue) "
        statusData.font = .boldSystemFont(ofSize: statusData.font.pointSize)
        statusData.textColor = .white
        statusData.backgroundColor = currentVessel.status.getStatusColor()
        statusData.sizeToFit()
        statusData.layer.cornerRadius = 3.0
        statusData.layer.masksToBounds = true
        statusData.frame.origin = CGPoint(x: statusLabel.frame.maxX, y: statusLabel.frame.minY)
        scrollView.addSubview(statusData)
        
        marineFleetLabel.text = "Marine Fleet: "
        marineFleetLabel.font = .systemFont(ofSize: marineFleetLabel.font.pointSize)
        marineFleetLabel.sizeToFit()
        marineFleetLabel.frame.origin = CGPoint(x: 20, y: statusLabel.frame.maxY + 5)
        scrollView.addSubview(marineFleetLabel)
        
        marineFleetData.text = " \(currentVessel.vesselName) "
        marineFleetData.font = .boldSystemFont(ofSize: marineFleetData.font.pointSize)
        marineFleetData.textColor = .white
        marineFleetData.sizeToFit()
        marineFleetData.isUserInteractionEnabled = true
        let marineFleetLink = LinkTapGestureRecognizer(target: self, action: #selector(openLink(sender:)))
        marineFleetLink.link = currentVessel.marineFleetLink
        marineFleetData.addGestureRecognizer(marineFleetLink)
        marineFleetData.layer.cornerRadius = 10.0
        marineFleetData.layer.masksToBounds = true
        marineFleetData.layer.borderWidth = 1.0
        marineFleetData.layer.borderColor = UIColor.white.cgColor
        marineFleetData.frame.origin = CGPoint(x: marineFleetLabel.frame.maxX, y: marineFleetLabel.frame.minY)
        scrollView.addSubview(marineFleetData)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: marineFleetData.frame.maxY + 10)
        
    }
    
    @objc func pushVesselAboutViewController() {
        let viewController = storyboard?.instantiateViewController(withIdentifier: VesselDetailAboutViewController.controllerIdentifier) as? VesselDetailAboutViewController
        viewController?.vesselName = currentVessel.vesselName
        viewController?.vesselDescription = currentVessel.description
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    @objc func openLink(sender: LinkTapGestureRecognizer) {
        if let url = URL(string: sender.link!) {
            UIApplication.shared.open(url)
        }
    }
    
    func updateFrameUsingBackgroundView(for label: UILabel, using view: UIView) -> CGSize {
        let maxSize = CGSize(width: view.bounds.width - 40, height: 1000)
        return label.sizeThatFits(maxSize)
    }
    
}
