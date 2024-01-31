//
//  ViewController.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    private var listModelData = [[ListModel]]()
    private var toggleSections = [0, 5]
    
    // MARK: - Ui
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCellWithToggle.self, forCellReuseIdentifier: CustomCellWithToggle.identifier)
        tableView.register(CustomCellClean.self, forCellReuseIdentifier: CustomCellClean.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        listModelData = ListModel.data
        view.backgroundColor = .white
        title = "Настройки"
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
    

    // MARK: - Actions

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Number of sections
    
    func numberOfSections(in tableView: UITableView) -> Int {
        listModelData.count
    }
    
    
    // MARK: - Number of rows
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listModelData[section].count
    }
    
    // MARK: - Cell setup
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellToggle = tableView.dequeueReusableCell(withIdentifier: CustomCellWithToggle.identifier, for: indexPath) as? CustomCellWithToggle
        let cellClean = tableView.dequeueReusableCell(withIdentifier: CustomCellClean.identifier, for: indexPath) as? CustomCellClean
        
              // Data
        
        let data = listModelData[indexPath.section][indexPath.row]
        
        // Transferring data to cells
        
        cellToggle?.configureListModel(with: data)
        cellClean?.configureListModel(with: data)
        
        // Which cell to display
        if indexPath.section == 0 && toggleSections.contains(indexPath.row) {
            return cellToggle ?? UITableViewCell()
        } else {
            return cellClean ?? UITableViewCell()
       
    }
    }
    
    // MARK: - Tapped on cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка: - \(listModelData[indexPath.section][indexPath.row].rowName)")
    }
    
    // MARK: - Height of row

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
