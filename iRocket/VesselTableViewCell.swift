//
//  VesselTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/12/23.
//

import UIKit

class VesselTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "VesselTableViewCell"
    
    private var scaleFactor = CGFloat()
    private var cellPadding = CGFloat()
    private var textPadding = CGFloat()
    private var cornerRadius = CGFloat()
    private var fontSize = CGFloat()
    
    private let imageLayer = UIImageView()
    private let backgroundLayer = UIView()
    
    private let photoCreditLayer = UILabel()
    
    private let nameLayerTag = UILabel()
    private let nameLayerText = UILabel()
    
    private let statusLayerText = UILabel()
    
    private let portLayerTag = UILabel()
    private let portLayerText = UILabel()
    
    private let employerLayerTag = UILabel()
    private let employerLayerText = UILabel()
    
    public func createVesselPreview(with currentVessel: Vessel) {
        
        scaleFactor = contentView.frame.width / 390
        textPadding = 5.0 * scaleFactor
        cornerRadius = 10.0 * scaleFactor
        cellPadding = 10.0 * scaleFactor
        fontSize = 17.0 * scaleFactor
        
        imageLayer.image = UIImage(named: currentVessel.vesselName.replacingOccurrences(of: " ", with: ""))
        imageLayer.contentMode = .scaleAspectFill
        imageLayer.clipsToBounds = true
        imageLayer.layer.cornerRadius = cornerRadius
        imageLayer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        backgroundLayer.backgroundColor = .gray
        backgroundLayer.layer.cornerRadius = cornerRadius
        backgroundLayer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        photoCreditLayer.backgroundColor = .darkGray
        photoCreditLayer.text = " 📸 PC: \(currentVessel.photographerCredit) "
        photoCreditLayer.textColor = .white
        photoCreditLayer.font = .systemFont(ofSize: 10 * scaleFactor)
        photoCreditLayer.sizeToFit()
        photoCreditLayer.layer.cornerRadius = (photoCreditLayer.frame.height / 2)
        photoCreditLayer.layer.masksToBounds = true
    
        nameLayerTag.text = "Name: "
        nameLayerTag.font = .boldSystemFont(ofSize: fontSize)
        nameLayerTag.sizeToFit()
        
        nameLayerText.text = currentVessel.vesselName
        nameLayerText.font = .systemFont(ofSize: fontSize)
        nameLayerText.sizeToFit()
        
        statusLayerText.backgroundColor = (currentVessel.status == .active ? .systemGreen : .red)
        statusLayerText.text = " \(currentVessel.status.rawValue) "
        statusLayerText.textColor = .white
        statusLayerText.font = .boldSystemFont(ofSize: fontSize)
        statusLayerText.layer.cornerRadius = 3.0 * scaleFactor
        statusLayerText.layer.masksToBounds = true
        statusLayerText.sizeToFit()
        
        portLayerTag.text = "Port: "
        portLayerTag.font = .boldSystemFont(ofSize: fontSize)
        portLayerTag.sizeToFit()
        
        portLayerText.text = currentVessel.homePort
        portLayerText.font = .systemFont(ofSize: fontSize)
        portLayerText.sizeToFit()
        
        employerLayerTag.text = "Employer: "
        employerLayerTag.font = .boldSystemFont(ofSize: fontSize)
        employerLayerTag.sizeToFit()
    
        employerLayerText.text = currentVessel.chartererName
        employerLayerText.font = .systemFont(ofSize: fontSize)
        employerLayerText.sizeToFit()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(imageLayer)
        contentView.addSubview(backgroundLayer)
        contentView.addSubview(photoCreditLayer)
        contentView.addSubview(nameLayerTag)
        contentView.addSubview(nameLayerText)
        contentView.addSubview(statusLayerText)
        contentView.addSubview(portLayerTag)
        contentView.addSubview(portLayerText)
        contentView.addSubview(employerLayerTag)
        contentView.addSubview(employerLayerText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageLayer.frame = CGRect(x: cellPadding, y: cellPadding, width: contentView.frame.width - (2 * cellPadding), height: 200 * scaleFactor)
        backgroundLayer.frame = CGRect(x: cellPadding, y: imageLayer.frame.maxY, width: contentView.frame.width - (2 * cellPadding), height: 55 * scaleFactor)
        
        photoCreditLayer.frame.origin = CGPoint(x: imageLayer.frame.maxX - textPadding - photoCreditLayer.frame.width, y: cellPadding + textPadding)
        
        nameLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: imageLayer.frame.maxY + textPadding)
        nameLayerText.frame.origin = CGPoint(x: nameLayerTag.frame.maxX, y: imageLayer.frame.maxY + textPadding)
        
        statusLayerText.frame.origin = CGPoint(x: backgroundLayer.frame.maxX - textPadding - statusLayerText.frame.width, y: nameLayerTag.frame.minY)
        
        portLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.minX + textPadding, y: backgroundLayer.frame.maxY - textPadding - portLayerTag.frame.height)
        portLayerText.frame.origin = CGPoint(x: portLayerTag.frame.maxX, y: portLayerTag.frame.minY)
        
        employerLayerTag.frame.origin = CGPoint(x: backgroundLayer.frame.maxX - textPadding - employerLayerTag.frame.width - employerLayerText.frame.width, y: backgroundLayer.frame.maxY - textPadding - employerLayerTag.frame.height)
        employerLayerText.frame.origin = CGPoint(x: employerLayerTag.frame.maxX, y: employerLayerTag.frame.minY)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
