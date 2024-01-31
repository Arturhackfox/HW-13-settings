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
    var imageBackgroundColor: UIColor
    var status: String = " "
    
    static var data: [[ListModel]] = [
        // MARK: - Section 1
        [ListModel(imageName: "airplane", rowName: "Авиарежим", imageBackgroundColor: UIColor.systemOrange),
         ListModel(imageName: "wifi", rowName: "Wi-Fi", imageBackgroundColor: UIColor.systemBlue, status: "Не подключенно"),
         ListModel(imageName: "bluetooth", rowName: "Bluetooth", imageBackgroundColor: UIColor.systemBlue, status: "Вкл."),
         ListModel(imageName: "antenna.radiowaves.left.and.right", rowName: "Сотовая связь", imageBackgroundColor: UIColor.customGreen),
         ListModel(imageName: "personalhotspot", rowName: "Режим модема", imageBackgroundColor: UIColor.customGreen),
         ListModel(imageName: "vpn", rowName: "VPN", imageBackgroundColor: UIColor.systemBlue)
        ],
        // MARK: - Section 2
        [ListModel(imageName: "app.badge", rowName: "Уведомления", imageBackgroundColor: UIColor.red),
         ListModel(imageName: "volume.3", rowName: "Звуки, тактильные сигналы", imageBackgroundColor: UIColor.systemPink),
         ListModel(imageName: "moon.fill", rowName: "Не беспокоить", imageBackgroundColor: UIColor.blue),
         ListModel(imageName: "hourglass", rowName: "Экранное время", imageBackgroundColor: UIColor.blue),
         
        ],
        // MARK: - Section 3
        [ListModel(imageName: "gear", rowName: "Основные", imageBackgroundColor: UIColor.systemGray),
         ListModel(imageName: "switch.2", rowName: "Пункт управления", imageBackgroundColor: UIColor.systemGray),
         ListModel(imageName: "textformat.size", rowName: "Экран и яркость", imageBackgroundColor: UIColor.systemBlue),
         ListModel(imageName: "apps.ipad.landscape", rowName: "Экран Домой", imageBackgroundColor: UIColor.systemBlue),
         ListModel(imageName: "accessibility", rowName: "Универсальный доступ", imageBackgroundColor: UIColor.systemBlue)
        ]
    ]
}
