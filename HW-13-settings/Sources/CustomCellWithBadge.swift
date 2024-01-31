//
//  toggleView.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class CustomCellWithBadge: UITableViewCell {
    // MARK: - Virables
    
    static var identifier = "CustomCellWithBadge"
    
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
    
    private lazy var badgeLabel: UILabel = {
        let label =  UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title3)
        label.backgroundColor = .red
        label.layer.cornerRadius = 11
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
        addSubview(badgeLabel)
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
            
            badgeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            badgeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            badgeLabel.widthAnchor.constraint(equalToConstant: 30)
            
        ])
    }
    
    // MARK: - Actions
    
    func configureListModel(with model: ListModel) {
        let bluetooth = "bluetooth"
        let vpn = "vpn"
        iconBackground.backgroundColor = model.imageBackgroundColor
        if model.imageName == bluetooth  {
            if let image = UIImage(named: bluetooth){
                let resizedImage = resizeImage(image, targetSize: CGSize(width: 20, height: 20))
                
                iconImage.image = resizedImage
            }
        } else if model.imageName == vpn {
            if let image = UIImage(named: vpn){
                let resizedImage = resizeImage(image, targetSize: CGSize(width: 20, height: 20))
                iconImage.image = resizedImage
            }
        } else {
            iconImage.image = UIImage(systemName: model.imageName)
        }
        rowLabel.text = model.rowName
    }
    
    private func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let newSize = widthRatio > heightRatio ? CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
    
}
