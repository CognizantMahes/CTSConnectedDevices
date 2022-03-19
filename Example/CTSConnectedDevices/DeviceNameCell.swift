//
//  DeviceNameCell.swift
//  CTSConnectedDevices_Example
//
//  Created by C, Maheswaran (Cognizant) on 15/03/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
class DeviceNameCell: UITableViewCell {
    var deviceName = UILabel()
    override func awakeFromNib() {
           super.awakeFromNib()
           // Initialization code
       }
       
       override func setSelected(_ selected: Bool, animated: Bool) {
           super.setSelected(selected, animated: animated)
           
           // Configure the view for the selected state
       }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           setupLabels()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    func setupLabels() {
        deviceName.translatesAutoresizingMaskIntoConstraints = false
        deviceName.font = UIFont.boldSystemFont(ofSize: 18)
        deviceName.numberOfLines = 0
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stack)
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.addArrangedSubview(deviceName)
    }
}

