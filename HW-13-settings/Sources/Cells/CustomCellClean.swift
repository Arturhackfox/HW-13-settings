//
//  CustomCellClean.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class CustomCellClean: UITableViewCell {
    // MARK: - Virables
    
    static var identifier = "CustomCellClean"
    
    // MARK: - Ui
    
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var iconBackground: UIView = {
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
        toggle.setOn(false, animated: true)
        toggle.addTarget(self, action: #selector(switchValueChanged), for: .touchUpInside)
        
        return toggle
    }()
    
    private lazy var statusLabel: UILabel = {
        let label =  UILabel()
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var badgeLabel: UILabel = {
        let label =  UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.backgroundColor = .red
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        return label
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
        addSubview(statusLabel)
        addSubview(badgeLabel)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -307),
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
            
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            statusLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            badgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            badgeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            badgeLabel.widthAnchor.constraint(equalToConstant: 25)
            
            
        ])
    }
    
    // MARK: - Actions
    
    func configureListModel(with model: ListModel) {
        
        // Configure Image background / foreground
        
        switch model.imageName {
        case "bluetooth":
            if let image = UIImage(named: "bluetooth"){
                let resizedImage = resizeImage(image, targetSize: CGSize(width: 20, height: 20))
                iconImage.image = resizedImage
                iconBackground.backgroundColor = model.imageBackgroundColor.selectedColor
            }
        case "vpn":
            if let image = UIImage(named: "vpn"){
                let resizedImage = resizeImage(image, targetSize: CGSize(width: 20, height: 20))
                iconImage.image = resizedImage
                iconBackground.backgroundColor = model.imageBackgroundColor.selectedColor
            }
        default:
            iconBackground.backgroundColor = model.imageBackgroundColor.selectedColor
            iconImage.image = UIImage(systemName: model.imageName)
        }
        
        // Configure cell view based on selected type
        
        switch model.type {
        case .clean:
            accessoryType = .disclosureIndicator
            rowLabel.text = model.rowName
            badgeLabel.isHidden = true
            toggleSwitch.isHidden = true
            statusLabel.isHidden = true
            
            
        case .describing:
            accessoryType = .disclosureIndicator
            rowLabel.text = model.rowName
            statusLabel.text = model.status
            badgeLabel.isHidden = true
            toggleSwitch.isHidden = true
            
        case .badge:
            accessoryType = .disclosureIndicator
            rowLabel.text = model.rowName
            badgeLabel.text = model.badgeCount
            statusLabel.isHidden = true
            toggleSwitch.isHidden = true
            
            
        case .toggle:
            selectionStyle = .none
            accessoryView = toggleSwitch
            rowLabel.text = model.rowName
            badgeLabel.isHidden = true
            statusLabel.isHidden = true
        }
        
    }
    
    @objc private func switchValueChanged() {}
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
        accessoryView = .none
    }
}

#Preview {
    ViewController()
}

