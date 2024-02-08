//
//  ListModelToInitialize.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 08.02.2024.
//

import Foundation

final class ListModelToInitialize {
    func createModels() -> [[ListModel]] {
        return [
            // MARK: - Section 1
            [ListModel(imageName: "airplane", rowName: "Авиарежим", imageBackgroundColor: AppColors.systemOrange, type: .toggle),
             ListModel(imageName: "wifi", rowName: "Wi-Fi", imageBackgroundColor: AppColors.systemBlue, status: "Не подключенно", type: .describing),
             ListModel(imageName: "bluetooth", rowName: "Bluetooth", imageBackgroundColor: AppColors.systemBlue, status: "Вкл.", type: .describing),
             ListModel(imageName: "antenna.radiowaves.left.and.right", rowName: "Сотовая связь", imageBackgroundColor: AppColors.customGreen),
             ListModel(imageName: "personalhotspot", rowName: "Режим модема", imageBackgroundColor: AppColors.customGreen),
             ListModel(imageName: "vpn", rowName: "VPN", imageBackgroundColor: AppColors.systemBlue, type: .toggle)
            ],
            // MARK: - Section 2
            [ListModel(imageName: "app.badge", rowName: "Уведомления", imageBackgroundColor: AppColors.red),
             ListModel(imageName: "volume.3", rowName: "Звуки, тактильные сигналы", imageBackgroundColor: AppColors.pink),
             ListModel(imageName: "moon.fill", rowName: "Не беспокоить", imageBackgroundColor: AppColors.blue),
             ListModel(imageName: "hourglass", rowName: "Экранное время", imageBackgroundColor: AppColors.blue),
             
            ],
            // MARK: - Section 3
            [ListModel(imageName: "gear", rowName: "Основные", imageBackgroundColor: AppColors.gray, type: .badge),
             ListModel(imageName: "switch.2", rowName: "Пункт управления", imageBackgroundColor: AppColors.gray),
             ListModel(imageName: "textformat.size", rowName: "Экран и яркость", imageBackgroundColor: AppColors.systemBlue),
             ListModel(imageName: "apps.ipad.landscape", rowName: "Экран Домой", imageBackgroundColor: AppColors.systemBlue),
             ListModel(imageName: "accessibility", rowName: "Универсальный доступ", imageBackgroundColor: AppColors.systemBlue)
            ]
        ]
    }
}
