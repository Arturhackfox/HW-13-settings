//
//  ViewController.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 31.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables
    
    private var listModelData: [[ListModel]] = ListModel.data
    
    // MARK: - Ui
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCellClean.self, forCellReuseIdentifier: CustomCellClean.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Настройки"
    }
    
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
        // Data
        let data = listModelData[indexPath.section][indexPath.row]
        
        // Which cell to display
        let cellClean = tableView.dequeueReusableCell(withIdentifier: CustomCellClean.identifier, for: indexPath) as? CustomCellClean
        
        cellClean?.configureListModel(with: data)
        
        return cellClean ?? UITableViewCell()
    }
    
    // MARK: - Tapped on cell
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Нажата ячейка: - \(listModelData[indexPath.section][indexPath.row].rowName)")
        
        // Navigate to selected row
        
        let pushVc = DetailViewController()
        let data = listModelData[indexPath.section][indexPath.row]
        pushVc.listModel = data
        
        guard data.type != .toggle else { return }
        
        navigationController?.pushViewController(pushVc, animated: true)
    }
    
    
    // MARK: - Height of row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    
}

#Preview {
    ViewController()
}
