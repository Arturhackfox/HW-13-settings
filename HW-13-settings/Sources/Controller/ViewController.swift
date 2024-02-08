//
//  ViewController.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Data
    
    private var model: ListModelToInitialize?
    
    // MARK: - Talking to my view
    private var tableView: TableView? {
        guard isViewLoaded else { return nil }
        
        return view as? TableView
    }
  
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view = TableView()
        model = ListModelToInitialize()
    }
}

// MARK: Configure

extension ViewController {
    private func configure() {
        guard let receivedData = model?.createModels() else { return }
        tableView?.configure(with: receivedData)
    }
}


#Preview {
    ViewController()
}
