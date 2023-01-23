//
//  LaunchTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    static let cellIdentifier = "LaunchTableViewCell"
    
    public var height: CGFloat = 240
    
    private var scaleFactor = CGFloat()
    private var cellPadding = CGFloat()
    private var textPadding = CGFloat()
    private var cornerRadius = CGFloat()
    private var fontSize = CGFloat()
    
    private let imageLayer = UIImageView()
    private let backgroundLayer = UIView()
    
    private let nameLayerText = UILabel()
    private let providerLayerText = UILabel()
    private let vehicleLayerText = UILabel()
    private let locationLayerText = UILabel()
    
    private let dateLayerTag = UILabel()
    private let dateLayerText = UILabel()
    
    public func createLaunchPreview(with currentLaunch: Launch) {
        
        scaleFactor = contentView.frame.width / 390
        textPadding = 5.0 * scaleFactor
        cornerRadius = 10.0 * scaleFactor
        cellPadding = 10.0 * scaleFactor
        fontSize = 15.0 * scaleFactor
        
        //Image = 140 wide, Background = 230 wide
        imageLayer.backgroundColor = .brown
        imageLayer.image = UIImage(named: ("\(currentLaunch.vehicleName) \(currentLaunch.vehicleVariant)").replacingOccurrences(of: " ", with: ""))
        imageLayer.contentMode = .scaleAspectFill
        imageLayer.clipsToBounds = true
        imageLayer.layer.cornerRadius = cornerRadius
        imageLayer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        backgroundLayer.backgroundColor = .gray
        backgroundLayer.layer.cornerRadius = cornerRadius
        backgroundLayer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        nameLayerText.text = currentLaunch.name
        nameLayerText.font = .boldSystemFont(ofSize: 20.0 * scaleFactor)
        nameLayerText.textColor = .white
        nameLayerText.sizeToFit()
        
        providerLayerText.text = currentLaunch.launchProvider
        providerLayerText.font = .boldSystemFont(ofSize: fontSize)
        providerLayerText.textColor = .white
        providerLayerText.sizeToFit()
        
        vehicleLayerText.text = "\(currentLaunch.vehicleName) \(currentLaunch.vehicleVariant)"
        vehicleLayerText.font = .boldSystemFont(ofSize: fontSize)
        vehicleLayerText.textColor = .white
        vehicleLayerText.sizeToFit()
        
        locationLayerText.text = ""
        locationLayerText.font = .boldSystemFont(ofSize: fontSize)
        locationLayerText.textColor = .white
        
        let locationData = LocationDataLoader().locationData
        var currentLocation: Location
        for place in locationData {
            if place.shortName == currentLaunch.locationName {
                currentLocation = place
            }
        }

        
//        dateLayerTag.text = "Date: "
//        dateLayerTag.font = .boldSystemFont(ofSize: fontSize)
//        dateLayerTag.sizeToFit()
//
//        dateLayerText.text = currentLaunch.liftOffTime
//        dateLayerText.font = .systemFont(ofSize: fontSize)
//        dateLayerText.textColor = .white
//        dateLayerText.sizeToFit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLayer)
        contentView.addSubview(backgroundLayer)
        contentView.addSubview(nameLayerText)
        contentView.addSubview(providerLayerText)
        contentView.addSubview(vehicleLayerText)
        contentView.addSubview(locationLayerText)
//        contentView.addSubview(dateLayerTag)
//        contentView.addSubview(dateLayerText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageLayer.frame = CGRect(x: cellPadding, y: cellPadding, width: 140 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))
        backgroundLayer.frame = CGRect(x: imageLayer.frame.maxX, y: imageLayer.frame.minY, width: 230 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))
        
        nameLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: backgroundLayer.frame.minY + textPadding)
        
        providerLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: nameLayerText.frame.maxY + textPadding)
        
        vehicleLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: providerLayerText.frame.maxY + textPadding)
        
        locationLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: vehicleLayerText.frame.maxY + textPadding)
        
//        dateLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: nameLayerText.frame.maxY + textPadding)
//        dateLayerText.frame = CGRect(x: dateLayerTag.frame.maxX, y: dateLayerTag.frame.minY, width: backgroundLayer.frame.width - (2 * textPadding) - dateLayerTag.frame.width, height: 100)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
