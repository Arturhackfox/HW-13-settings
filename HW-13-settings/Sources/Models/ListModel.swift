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
    var status: String = " "
    
    static var data: [[ListModel]] = [
        // MARK: - Section 1
        [ListModel(imageName: "airplane", rowName: "Авиарежим", imageBackgroundColor: AppColors.systemOrange),
         ListModel(imageName: "wifi", rowName: "Wi-Fi", imageBackgroundColor: AppColors.systemBlue, status: "Не подключенно"),
         ListModel(imageName: "bluetooth", rowName: "Bluetooth", imageBackgroundColor: AppColors.systemBlue, status: "Вкл."),
         ListModel(imageName: "antenna.radiowaves.left.and.right", rowName: "Сотовая связь", imageBackgroundColor: AppColors.customGreen),
         ListModel(imageName: "personalhotspot", rowName: "Режим модема", imageBackgroundColor: AppColors.customGreen),
         ListModel(imageName: "vpn", rowName: "VPN", imageBackgroundColor: AppColors.systemBlue)
        ],
        // MARK: - Section 2
        [ListModel(imageName: "app.badge", rowName: "Уведомления", imageBackgroundColor: AppColors.red),
         ListModel(imageName: "volume.3", rowName: "Звуки, тактильные сигналы", imageBackgroundColor: AppColors.pink),
         ListModel(imageName: "moon.fill", rowName: "Не беспокоить", imageBackgroundColor: AppColors.blue),
         ListModel(imageName: "hourglass", rowName: "Экранное время", imageBackgroundColor: AppColors.blue),
         
        ],
        // MARK: - Section 3
        [ListModel(imageName: "gear", rowName: "Основные", imageBackgroundColor: AppColors.gray),
         ListModel(imageName: "switch.2", rowName: "Пункт управления", imageBackgroundColor: AppColors.gray),
         ListModel(imageName: "textformat.size", rowName: "Экран и яркость", imageBackgroundColor: AppColors.systemBlue),
         ListModel(imageName: "apps.ipad.landscape", rowName: "Экран Домой", imageBackgroundColor: AppColors.systemBlue),
         ListModel(imageName: "accessibility", rowName: "Универсальный доступ", imageBackgroundColor: AppColors.systemBlue)
        ]
    ]
    
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
            default:
                 UIColor.white
            }
        }
    }
}


