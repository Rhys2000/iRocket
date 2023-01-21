//
//  LocationTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/18/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    static let cellIdentifier = "LocationTableViewCell"
    
    private var scaleFactor = CGFloat()
    private var cellPadding = CGFloat()
    private var textPadding = CGFloat()
    private var cornerRadius = CGFloat()
    private var fontSize = CGFloat()
    
    private let imageLayer = UIImageView()
    private let backgroundLayer = UIView()
    
    private let nameLayerTag = UILabel()
    private let nameLayerText = UILabel()
    
    private let statusLayerText = UILabel()
    
    private let locationLayerTag = UILabel()
    private let locationLayerText = UILabel()
    
    private let ownerLayerTag = UILabel()
    private let ownerLayerText = UILabel()

    public func createLocationPreview(with currentLocation: Location) {
        
        scaleFactor = contentView.frame.width / 390
        textPadding = 5.0 * scaleFactor
        cornerRadius = 10.0 * scaleFactor
        cellPadding = 10.0 * scaleFactor
        fontSize = 16.0 * scaleFactor
        
        imageLayer.image = UIImage(named: currentLocation.shortName.replacingOccurrences(of: " ", with: ""))
        imageLayer.contentMode = .scaleAspectFill
        imageLayer.clipsToBounds = true
        imageLayer.layer.cornerRadius = cornerRadius
        imageLayer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        backgroundLayer.backgroundColor = .gray
        backgroundLayer.layer.cornerRadius = cornerRadius
        backgroundLayer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        nameLayerTag.text = "Name: "
        nameLayerTag.font = .boldSystemFont(ofSize: fontSize)
        nameLayerTag.sizeToFit()
        
        nameLayerText.text = currentLocation.fullName
        nameLayerText.font = .systemFont(ofSize: fontSize)
        nameLayerText.sizeToFit()
        
        statusLayerText.backgroundColor = (currentLocation.status == .active ? .systemGreen : .red)
        statusLayerText.text = " \(currentLocation.status.rawValue) "
        statusLayerText.textColor = .white
        statusLayerText.font = .boldSystemFont(ofSize: fontSize)
        statusLayerText.layer.cornerRadius = 3.0 * scaleFactor
        statusLayerText.layer.masksToBounds = true
        statusLayerText.sizeToFit()
        
        locationLayerTag.text = "Port: "
        locationLayerTag.font = .boldSystemFont(ofSize: fontSize)
        locationLayerTag.sizeToFit()
        
        locationLayerText.text = "\(currentLocation.cityState), \(currentLocation.country.rawValue)\(currentLocation.country.getFlagEmoji())"
        locationLayerText.font = .systemFont(ofSize: fontSize)
        locationLayerText.sizeToFit()
        
        ownerLayerTag.text = "Owner: "
        ownerLayerTag.font = .boldSystemFont(ofSize: fontSize)
        ownerLayerTag.sizeToFit()
    
        ownerLayerText.text = currentLocation.ownerAbbreviation
        ownerLayerText.font = .systemFont(ofSize: fontSize)
        ownerLayerText.sizeToFit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLayer)
        contentView.addSubview(backgroundLayer)
        contentView.addSubview(nameLayerTag)
        contentView.addSubview(nameLayerText)
        contentView.addSubview(statusLayerText)
        contentView.addSubview(locationLayerTag)
        contentView.addSubview(locationLayerText)
        contentView.addSubview(ownerLayerTag)
        contentView.addSubview(ownerLayerText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageLayer.frame = CGRect(x: cellPadding, y: cellPadding, width: contentView.frame.width - (2 * cellPadding), height: 200 * scaleFactor)
        backgroundLayer.frame = CGRect(x: cellPadding, y: imageLayer.frame.maxY, width: contentView.frame.width - (2 * cellPadding), height: 55 * scaleFactor)
        
        nameLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: imageLayer.frame.maxY + textPadding)
        nameLayerText.frame.origin = CGPoint(x: nameLayerTag.frame.maxX, y: imageLayer.frame.maxY + textPadding)
        
        statusLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.maxX - textPadding - statusLayerText.frame.width, y: nameLayerTag.frame.minY)
        
        locationLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: backgroundLayer.frame.maxY - textPadding - locationLayerTag.frame.height)
        locationLayerText.frame.origin = CGPoint(x: locationLayerTag.frame.maxX, y: locationLayerTag.frame.minY)
        
        ownerLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.maxX - textPadding - ownerLayerTag.frame.width - ownerLayerText.frame.width, y: backgroundLayer.frame.maxY - textPadding - ownerLayerTag.frame.height)
        ownerLayerText.frame.origin = CGPoint(x: ownerLayerTag.frame.maxX, y: ownerLayerTag.frame.minY)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
