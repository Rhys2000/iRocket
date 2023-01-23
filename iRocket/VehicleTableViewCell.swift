//
//  VehicleTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/19/23.
//

import UIKit

class VehicleTableViewCell: UITableViewCell {

    static let cellIdentifier = "VehicleTableViewCell"
    
    private var scaleFactor = CGFloat()
    private var cellPadding = CGFloat()
    private var textPadding = CGFloat()
    private var cornerRadius = CGFloat()
    private var fontSize = CGFloat()
    
    private let imageLayer = UIImageView()
    private let backgroundLayer = UIView()
    
    private let nameLayerTag = UILabel()
    private let nameLayerText = UILabel()
    
    private let familyLayerTag = UILabel()
    private let familyLayerText = UILabel()
    
    private let providerLayerTag = UILabel()
    private let providerLayerText = UILabel()
    
    private let variantLayerTag = UILabel()
    private let variantLayerText = UILabel()
    
    private let classLayerTag = UILabel()
    private let classLayerText = UILabel()
    
    private let reusableLayerTag = UILabel()
    private let reusableLayerText = UILabel()
    
    private let statusLayerTag = UILabel()
    private let statusLayerText = UILabel()
    
    public func createVehiclePreview(with currentVehicle: Vehicle) {
        
        scaleFactor = contentView.frame.width / 390
        textPadding = 5.0 * scaleFactor
        cornerRadius = 10.0 * scaleFactor
        cellPadding = 10.0 * scaleFactor
        fontSize = 17.0 * scaleFactor
        
        //Image = 140 wide, Background = 230 wide
        imageLayer.backgroundColor = .blue
        imageLayer.image = UIImage(named: currentVehicle.name.replacingOccurrences(of: " ", with: ""))
        imageLayer.contentMode = .scaleAspectFill
        imageLayer.clipsToBounds = true
        imageLayer.layer.cornerRadius = cornerRadius
        imageLayer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        backgroundLayer.backgroundColor = .gray
        backgroundLayer.layer.cornerRadius = cornerRadius
        backgroundLayer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        nameLayerTag.text = "Name:"
        nameLayerTag.font = .boldSystemFont(ofSize: fontSize)
        nameLayerTag.sizeToFit()
        
        nameLayerText.text = currentVehicle.name
        nameLayerText.font = .boldSystemFont(ofSize: fontSize)
        nameLayerText.textColor = .white
        nameLayerText.sizeToFit()
        
        familyLayerTag.text = "Family:"
        familyLayerTag.font = .boldSystemFont(ofSize: fontSize)
        familyLayerTag.sizeToFit()
        
        familyLayerText.text = currentVehicle.rocketFamily
        familyLayerText.font = .boldSystemFont(ofSize: fontSize)
        familyLayerText.textColor = .white
        familyLayerText.sizeToFit()
        
        providerLayerTag.text = "Provider:"
        providerLayerTag.font = .boldSystemFont(ofSize: fontSize)
        providerLayerTag.sizeToFit()
        
        providerLayerText.text = currentVehicle.providerName
        providerLayerText.font = .boldSystemFont(ofSize: fontSize)
        providerLayerText.textColor = .white
        providerLayerText.sizeToFit()
        
        variantLayerTag.text = "Variants:"
        variantLayerTag.font = .boldSystemFont(ofSize: fontSize)
        variantLayerTag.sizeToFit()
        
        variantLayerText.text = "\(currentVehicle.numberOfVariants)"
        variantLayerText.font = .boldSystemFont(ofSize: fontSize)
        variantLayerText.textColor = .white
        variantLayerText.sizeToFit()
        
        classLayerTag.text = "Class:"
        classLayerTag.font = .boldSystemFont(ofSize: fontSize)
        classLayerTag.sizeToFit()
        
        classLayerText.backgroundColor = (currentVehicle.orbitClass == .orbital ? .black : .link)
        classLayerText.text = "  \(currentVehicle.orbitClass.rawValue)  "
        classLayerText.textColor = .white
        classLayerText.font = .boldSystemFont(ofSize: fontSize)
        classLayerText.layer.cornerRadius = cornerRadius
        classLayerText.layer.masksToBounds = true
        classLayerText.sizeToFit()
        
        reusableLayerTag.text = "Reusability:"
        reusableLayerTag.font = .boldSystemFont(ofSize: fontSize)
        reusableLayerTag.sizeToFit()
        
        reusableLayerText.backgroundColor = currentVehicle.reusable.getReuseColor()
        reusableLayerText.text = "  \(currentVehicle.reusable.rawValue)  "
        reusableLayerText.textColor = .white
        reusableLayerText.font = .boldSystemFont(ofSize: fontSize)
        reusableLayerText.layer.cornerRadius = cornerRadius
        reusableLayerText.layer.masksToBounds = true
        reusableLayerText.sizeToFit()
        
        statusLayerTag.text = "Status:"
        statusLayerTag.font = .boldSystemFont(ofSize: fontSize)
        statusLayerTag.sizeToFit()
        
        statusLayerText.backgroundColor = currentVehicle.status.getStatusColor()
        statusLayerText.text = " \(currentVehicle.status.rawValue) "
        statusLayerText.textColor = .white
        statusLayerText.font = .boldSystemFont(ofSize: fontSize)
        statusLayerText.layer.cornerRadius = 3.0 * scaleFactor
        statusLayerText.layer.masksToBounds = true
        statusLayerText.sizeToFit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLayer)
        contentView.addSubview(backgroundLayer)
        contentView.addSubview(nameLayerTag)
        contentView.addSubview(familyLayerTag)
        contentView.addSubview(providerLayerTag)
        contentView.addSubview(variantLayerTag)
        contentView.addSubview(classLayerTag)
        contentView.addSubview(reusableLayerTag)
        contentView.addSubview(statusLayerTag)
        contentView.addSubview(nameLayerText)
        contentView.addSubview(familyLayerText)
        contentView.addSubview(providerLayerText)
        contentView.addSubview(variantLayerText)
        contentView.addSubview(classLayerText)
        contentView.addSubview(reusableLayerText)
        contentView.addSubview(statusLayerText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageLayer.frame = CGRect(x: cellPadding, y: cellPadding, width: 140 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))
        backgroundLayer.frame = CGRect(x: imageLayer.frame.maxX, y: imageLayer.frame.minY, width: 230 * scaleFactor, height: contentView.frame.height - (2 * cellPadding))
        
        //Changed
        nameLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: backgroundLayer.frame.minY + textPadding)
        
        //Changed
        statusLayerTag.frame.origin = CGPoint(x: reusableLayerTag.frame.minX, y: backgroundLayer.frame.maxY - textPadding - statusLayerTag.frame.height)
        
        //rename this variable
        let labelSpacing: CGFloat = ((statusLayerTag.frame.minY - nameLayerTag.frame.maxY) - (nameLayerTag.frame.height * 5)) / 6
        
        familyLayerTag.frame.origin = CGPoint(x: nameLayerTag.frame.minX, y: nameLayerTag.frame.maxY + labelSpacing)

        providerLayerTag.frame.origin = CGPoint(x: familyLayerTag.frame.minX, y: familyLayerTag.frame.maxY + labelSpacing)

        variantLayerTag.frame.origin = CGPoint(x: providerLayerTag.frame.minX, y: providerLayerTag.frame.maxY + labelSpacing)

        classLayerTag.frame.origin = CGPoint(x: variantLayerTag.frame.minX, y: variantLayerTag.frame.maxY + labelSpacing)

        reusableLayerTag.frame.origin = CGPoint(x: classLayerTag.frame.minX, y: classLayerTag.frame.maxY + labelSpacing)
        
        for i in 1...6 {
            let y: CGFloat = (labelSpacing * CGFloat(i)) + (nameLayerTag.frame.height * CGFloat(i)) + (labelSpacing / 2) + (textPadding / 2)
            let textSeparator = UIView(frame: CGRect(x: backgroundLayer.frame.minX + textPadding, y: y, width: backgroundLayer.frame.width - (2 * textPadding), height: 2))
            textSeparator.backgroundColor = .lightGray
            textSeparator.layer.opacity = 0.8
            textSeparator.layer.cornerRadius = 1.0
            textSeparator.layer.masksToBounds = true
            contentView.addSubview(textSeparator)
        }
        
        nameLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: nameLayerTag.frame.minY)
        
        familyLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: familyLayerTag.frame.minY)
        
        providerLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: providerLayerTag.frame.minY)
        
        variantLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: variantLayerTag.frame.minY)
        
        classLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: classLayerTag.frame.minY)
        
        reusableLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: reusableLayerTag.frame.minY)
        
        statusLayerText.frame.origin = CGPoint(x: reusableLayerTag.frame.maxX + (2 * textPadding), y: statusLayerTag.frame.minY)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
