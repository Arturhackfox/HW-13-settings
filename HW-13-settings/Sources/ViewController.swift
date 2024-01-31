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
    private var statusCellIndices = [1, 2]
    
    // MARK: - Ui
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCellWithToggle.self, forCellReuseIdentifier: CustomCellWithToggle.identifier)
        tableView.register(CustomCellClean.self, forCellReuseIdentifier: CustomCellClean.identifier)
        tableView.register(CustomCellWithBadge.self, forCellReuseIdentifier: CustomCellWithBadge.identifier)
        tableView.register(CustomCellWithStatus.self, forCellReuseIdentifier: CustomCellWithStatus.identifier)
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
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
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
        let cellWithBadge = tableView.dequeueReusableCell(withIdentifier: CustomCellWithBadge.identifier, for: indexPath) as? CustomCellWithBadge
        let cellWithStatus = tableView.dequeueReusableCell(withIdentifier: CustomCellWithStatus.identifier, for: indexPath) as? CustomCellWithStatus
        
        // Data
        
        let data = listModelData[indexPath.section][indexPath.row]
        
        // Transferring data to cells
        
        cellToggle?.configureListModel(with: data)
        cellClean?.configureListModel(with: data)
        cellWithBadge?.configureListModel(with: data)
        cellWithStatus?.configureListModel(with: data)
        
        // Accessories
        cellClean?.accessoryType = .disclosureIndicator
        cellWithBadge?.accessoryType = .disclosureIndicator
        cellWithStatus?.accessoryType = .disclosureIndicator
        
        // Which cell to display
        if indexPath.section == 0 && toggleSections.contains(indexPath.row) {
            return cellToggle ?? UITableViewCell()
        } else if indexPath.section == 2 && indexPath.row == 0{
            return cellWithBadge ?? UITableViewCell()
        } else if indexPath.section == 0 && statusCellIndices.contains(indexPath.row) {
            return cellWithStatus ?? UITableViewCell()
        } else {
            return cellClean ?? UITableViewCell()
            
        }
    }
    
    // MARK: - Tapped on cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка: - \(listModelData[indexPath.section][indexPath.row].rowName)")
        
        // Navigate to selected row
        
        let pushVc = DetailView()
        let data = listModelData[indexPath.section][indexPath.row]
        pushVc.listModel = data
        
        if indexPath.section == 0 && indexPath.row != 0 && indexPath.row != 5 {
            navigationController?.pushViewController(pushVc, animated: true)
        } else {
            navigationController?.pushViewController(pushVc, animated: true)
        }
    }
    
    
    // MARK: - Height of row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}
