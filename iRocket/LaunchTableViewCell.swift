//
//  LaunchTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class LaunchTableViewCell: UITableViewCell {

    static let cellIdentifier = "LaunchTableViewCell"
    
    private let dateFormatter = DateFormatter()
    private let calendar = Calendar.current
    
    public var height = CGFloat()
    
    private var scaleFactor = CGFloat()
    private var cellPadding = CGFloat()
    private var textPadding = CGFloat()
    private var cornerRadius = CGFloat()
    private var fontSize = CGFloat()
    
    private let imageLayer = UIImageView()
    private let backgroundLayer = UIView()
    
    private let nameLayerText = UILabel()
    
    private let providerLayerTag = UILabel()
    private let providerLayerText = UILabel()
    
    private let vehicleLayerTag = UILabel()
    private let vehicleLayerText = UILabel()
    
    private let locationLayerText = UILabel()
    
    private let dateLayerText = UILabel()
    
    private let tempLayer = UIView()
    
    public func createLaunchPreview(with currentLaunch: Launch, using width: CGFloat) {
        
        scaleFactor = width / 390
        textPadding = 5.0 * scaleFactor
        cornerRadius = 10.0 * scaleFactor
        cellPadding = 10.0 * scaleFactor
        fontSize = 15.0 * scaleFactor

        let locationInformation = LocationDataLoader().locationData.first(where: {$0.shortName == currentLaunch.locationName})!
        let padInformation = locationInformation.launchPads.first(where: {$0.abbreviation == currentLaunch.locationPad})!

        //Image = 120 wide, Background = 250 wide
        imageLayer.backgroundColor = .brown
        imageLayer.image = UIImage(named: ("\(currentLaunch.vehicleName) \(currentLaunch.vehicleVariant)").replacingOccurrences(of: " ", with: ""))
        imageLayer.contentMode = .scaleAspectFill
        imageLayer.clipsToBounds = true
        imageLayer.layer.cornerRadius = cornerRadius
        imageLayer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]

        backgroundLayer.backgroundColor = .gray
        backgroundLayer.layer.cornerRadius = cornerRadius
        backgroundLayer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]

        nameLayerText.text = "\(currentLaunch.name)"
        if(currentLaunch.abbreviatedName != "") {
            nameLayerText.text! += " (\(currentLaunch.abbreviatedName))"
        }
        nameLayerText.font = .boldSystemFont(ofSize: 20.0 * scaleFactor)
        nameLayerText.textColor = .white
        nameLayerText.numberOfLines = 3
        nameLayerText.frame.size = updateLabelFrame(width: 240, label: nameLayerText)

        providerLayerTag.text = "Provider: "
        providerLayerTag.font = .boldSystemFont(ofSize: fontSize)
        providerLayerTag.sizeToFit()

        providerLayerText.text = currentLaunch.launchProvider
        providerLayerText.font = .boldSystemFont(ofSize: fontSize)
        providerLayerText.textColor = .white
        providerLayerText.sizeToFit()

        vehicleLayerTag.text = "Vehicle: "
        vehicleLayerTag.font = .boldSystemFont(ofSize: fontSize)
        vehicleLayerTag.sizeToFit()

        vehicleLayerText.text = "\(currentLaunch.vehicleName) \(currentLaunch.vehicleVariant)"
        vehicleLayerText.font = .boldSystemFont(ofSize: fontSize)
        vehicleLayerText.textColor = .white
        vehicleLayerText.sizeToFit()

        locationLayerText.text = "\(padInformation.name) (\(padInformation.abbreviation)), \(locationInformation.fullName) (\(locationInformation.abbreviation)), \(locationInformation.cityState), \(locationInformation.country) \(locationInformation.country.getFlagEmoji())"
        locationLayerText.font = .boldSystemFont(ofSize: 12.0 * scaleFactor)
        locationLayerText.textColor = .white
        locationLayerText.numberOfLines = 0
        locationLayerText.frame.size = updateLabelFrame(width: 240, label: locationLayerText)

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en-US")
//        let localComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second, .timeZone], from: dateFormatter.date(from: currentLaunch.liftOffTime)!)
        dateFormatter.dateFormat = "E, MMMM d, yyyy h:mm:ss a (zzz)"
        //dateLayerText.text = dateFormatter.string(from: calendar.date(from: localComponents)!)
        dateLayerText.text = "Behold"
        dateLayerText.font = .boldSystemFont(ofSize: fontSize)
        dateLayerText.textColor = .blue
        dateLayerText.numberOfLines = 0
        dateLayerText.frame.size = updateLabelFrame(width: 240, label: dateLayerText)

        imageLayer.frame = CGRect(x: cellPadding, y: cellPadding, width: 120 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))
        backgroundLayer.frame = CGRect(x: imageLayer.frame.maxX, y: imageLayer.frame.minY, width: 250 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))

        nameLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: backgroundLayer.frame.minY + textPadding)

        providerLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: nameLayerText.frame.maxY + textPadding)
        providerLayerText.frame.origin = CGPoint(x: providerLayerTag.frame.maxX, y: providerLayerTag.frame.minY)

        vehicleLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: providerLayerText.frame.maxY + textPadding)
        vehicleLayerText.frame.origin = CGPoint(x: providerLayerTag.frame.maxX, y: vehicleLayerTag.frame.minY)

        locationLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: vehicleLayerText.frame.maxY + textPadding)

        dateLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: locationLayerText.frame.maxY + textPadding)

        tempLayer.frame.origin = CGPoint(x: backgroundLayer.frame.minX, y: dateLayerText.frame.maxY)

        contentView.frame.size.height = dateLayerText.frame.maxY + textPadding + cellPadding

        imageLayer.frame.size.height = CGFloat(contentView.frame.maxY - (2 * cellPadding))
        backgroundLayer.frame.size.height = CGFloat(contentView.frame.maxY - (2 * cellPadding))
        height = contentView.frame.size.height
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLayer)
        contentView.addSubview(backgroundLayer)
        contentView.addSubview(nameLayerText)
        contentView.addSubview(providerLayerTag)
        contentView.addSubview(providerLayerText)
        contentView.addSubview(vehicleLayerTag)
        contentView.addSubview(vehicleLayerText)
        contentView.addSubview(locationLayerText)
        contentView.addSubview(dateLayerText)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func updateLabelFrame(width: CGFloat, label: UILabel) -> CGSize {
        let maxSize = CGSize(width: width, height: 1000)
        let size = label.sizeThatFits(maxSize)
        return size
    }
}
