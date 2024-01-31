//
//  toggleView.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class ToggleView: UIView {
    private lazy var toggleSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.setOn(false, animated: true)
        toggle.addTarget(self, action: #selector(togglePressed), for: .touchUpInside)
        
        return toggle
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        addSubview(toggleSwitch)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            toggleSwitch.topAnchor.constraint(equalTo: topAnchor),
            toggleSwitch.bottomAnchor.constraint(equalTo: bottomAnchor),
            toggleSwitch.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250),
            toggleSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
    }
    

    @objc
      func togglePressed() {
        print("нажата дичара")
    }
}
