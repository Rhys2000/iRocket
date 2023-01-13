//
//  VesselTableViewCell.swift
//  iRocket
//
//  Created by Rhys Julian-Jones on 1/12/23.
//

import UIKit

class VesselTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "VesselTableViewCell"
    
    private let vesselImage = UIView()
    
    private let padding = 10
    
    public func createVesselPreview(with currentVessel: Vessel) {
        vesselImage.backgroundColor = .magenta
        vesselImage.layer.cornerRadius = 10.0
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(vesselImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        vesselImage.frame = CGRect(x: padding, y: padding, width: Int(contentView.frame.width) - (2 * padding), height: Int(contentView.frame.height) - (2 * padding))
        //print(contentView.frame.width, contentView.frame.height)
    }
}
