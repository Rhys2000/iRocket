//
//  VesselTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/12/23.
//

import UIKit

class VesselTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "VesselTableViewCell"
    
    private let backgroundImage = UIView()
    private let nameLabel = UILabel()
    
    private let padding = 10
    
    public func createVesselPreview(with currentVessel: Vessel) {
        backgroundImage.backgroundColor = .magenta
        backgroundImage.layer.cornerRadius = 10.0
        
        nameLabel.text = " \(currentVessel.name) "
        nameLabel.font = .boldSystemFont(ofSize: 22)
        nameLabel.textColor = .black
        nameLabel.backgroundColor = .white
        nameLabel.sizeToFit()
        print(nameLabel.text!, nameLabel.frame.size)
        nameLabel.layer.opacity = 0.6
        nameLabel.layer.cornerRadius = 10.0
        nameLabel.clipsToBounds = true
        nameLabel.adjustsFontSizeToFitWidth = true
        scaleToDevice(with: nameLabel)
    }
    
    func scaleToDevice(with currentObject: UILabel) {
        currentObject.frame.size.width = currentObject.frame.width * (contentView.frame.width / 390)
        currentObject.frame.size.height = currentObject.frame.height * (contentView.frame.width / 390)
        currentObject.font = .boldSystemFont(ofSize: 22 * (contentView.frame.width / 390))
        layoutSubviews()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(backgroundImage)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundImage.frame = CGRect(x: padding, y: padding, width: Int(contentView.frame.width) - (2 * padding), height: Int(contentView.frame.height) - (2 * padding))
        nameLabel.frame.origin = CGPoint(x: CGFloat(padding + 5), y: CGFloat(padding + 5))
        //nameLabel.frame.size.height = CGFloat(100)
        print(nameLabel.text!, nameLabel.frame.size)
        //print(contentView.frame.width, contentView.frame.height)
    }
}
