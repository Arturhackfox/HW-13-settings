//
//  CustomCellWithToggle.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class CustomCellWithToggle: UITableViewCell {
    
    // MARK: - Virables
    
    static var identifier = "CustomCellWithToggle"
    
    // MARK: - Ui
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var iconBackground: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var rowLabel: UILabel = {
        let label =  UILabel()
        label.text = "Авиарежим"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.isOn = false
        toggle.preferredStyle = .sliding
        
        return toggle
    }()
    
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(iconBackground)
        addSubview(iconImage)
        addSubview(rowLabel)
        addSubview(toggleSwitch)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -347),
            iconBackground.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconBackground.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            iconBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.topAnchor.constraint(equalTo: iconBackground.topAnchor, constant: 5),
            iconImage.bottomAnchor.constraint(equalTo: iconBackground.bottomAnchor, constant: -5),
            iconImage.leadingAnchor.constraint(equalTo: iconBackground.leadingAnchor, constant: 5),
            iconImage.trailingAnchor.constraint(equalTo: iconBackground.trailingAnchor, constant: -5),
            
            rowLabel.leadingAnchor.constraint(equalTo: iconBackground.trailingAnchor, constant: 15),
            rowLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            toggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            toggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    
    // MARK: - Actions
    
    func configureListModel(with model: ListModel) {
        let bluetooth = "bluetooth"
        let vpn = "vpn"
        iconBackground.backgroundColor = model.imageBackgroundColor
        if model.imageName == bluetooth  {
            iconImage.image = UIImage(named: bluetooth)
        } else if model.imageName == vpn {
            iconImage.image = UIImage(named: vpn)
        } else {
            iconImage.image = UIImage(systemName: model.imageName)

        }
    }
    
}
