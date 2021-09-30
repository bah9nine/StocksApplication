//
//  DisplayManager.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import UIKit

class StocksDisplayManager: NSObject {
    weak var delegate: StocksDisplayManagerDelegate?
    private var stocksArray: [Stock] = []
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        setupTableView()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: StockCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: StockCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
    
    func reloadData(_ stocks: [Stock]) {
        stocksArray = stocks
        tableView.reloadData()
    }
}

extension StocksDisplayManager: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StockCell.identifier) as! StockCell
        let stock = stocksArray[indexPath.row]
        cell.fill(stock)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stock = stocksArray[indexPath.row]
        delegate?.stocksDisplayManager(self, didSelected: stock)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
