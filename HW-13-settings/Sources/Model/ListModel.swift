//
//  ListModel.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit


struct ListModel: Hashable {
    var imageName: String
    var rowName: String
    var imageBackgroundColor: AppColors
    var status: String? = nil
    var type: CellType = .clean
    var badgeCount: String = "1"
    
}

enum AppColors {
    case systemOrange
    case systemBlue
    case customGreen
    case red
    case blue
    case gray
    case pink
    
    var selectedColor: UIColor {
        switch self {
        case .blue:
             UIColor.blue
        case .customGreen:
             UIColor.customGreen
        case .gray:
             UIColor.systemGray
        case .pink:
             UIColor.systemPink
        case .systemBlue:
             UIColor.systemBlue
        case .systemOrange:
             UIColor.systemOrange
        case .red:
            UIColor.red
        }
    }
}

enum CellType {
    case clean, toggle, describing, badge
}
