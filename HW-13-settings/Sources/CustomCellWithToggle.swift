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
        let image = UIImage(systemName: "airplane")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var iconBackground: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        
        return view
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
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            iconBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            iconBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -345),
            iconBackground.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconBackground.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            iconBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            
            iconImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconImage.topAnchor.constraint(equalTo: iconBackground.topAnchor, constant: 5),
            iconImage.bottomAnchor.constraint(equalTo: iconBackground.bottomAnchor, constant: -5),
            iconImage.leadingAnchor.constraint(equalTo: iconBackground.leadingAnchor, constant: 5),
            iconImage.trailingAnchor.constraint(equalTo: iconBackground.trailingAnchor, constant: -5),
            
        ])
    }
    
}
