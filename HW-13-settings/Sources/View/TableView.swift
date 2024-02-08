//
//  TableView.swift
//  HW-13-settings
//
//  Created by Arthur Sh on 08.02.2024.
//

import UIKit

protocol TableViewDelegate: AnyObject {
    func pushViewController(vc: UIViewController)
}

class TableView: UIView {
    
    // MARK: Received data
        
     weak var delegate: TableViewDelegate?
     var listModelData = [[ListModel]]()
    
    // MARK: - Configure
    
    func configure(with data: [[ListModel]], controller: UIViewController) {
        listModelData = data
        delegate = controller as? TableViewDelegate 
    }
    
    // MARK: - Ui
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomCellClean.self, forCellReuseIdentifier: CustomCellClean.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        addSubview(tableView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}

extension TableView: UITableViewDataSource, UITableViewDelegate {
    
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
        
        // MARK: - !!!!!!!!!!!!!!!!!!!!!
        delegate?.pushViewController(vc: pushVc)
//        navigationController?.pushViewController(pushVc, animated: true)
    }
    
    
    // MARK: - Height of row
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    
}
