//
//  PromotionsViewController.swift
//  promotionsApp
//
//  Created by Иван Миронов on 02.05.2021.
//

import UIKit
import NVActivityIndicatorView

class StocksViewController: UIViewController, StocksViewInput {
    var output: StocksViewOutput!
    var displayManager: StocksDisplayManager?
    var stock: Stock?
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControll: UISegmentedControl!
    @IBOutlet weak var reconnectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output = StocksPresenter(view: self)
        displayManager = StocksDisplayManager(tableView: tableView)
        displayManager?.delegate = self
        output.viewIsReady()
    }

    func setupInitialState() {
        navigationItem.title = "Shares list"
        reconnectButton.isHidden = true
        setupSegmentCotroll()
        setupActivityIndicator()
    }
    
    func setupActivityIndicator() {
        activityIndicatorView.type = .ballSpinFadeLoader
        activityIndicatorView.color = .black
    }
    
    func setupSegmentCotroll() {
        segmentControll.removeAllSegments()
        
        StocksType.allCases.enumerated().forEach { (item) in
            let type = item.element
            let index = item.offset
            segmentControll.insertSegment(withTitle: type.title, at: index, animated: true)
        }
        segmentControll.selectedSegmentIndex = 0
    }
    
    @IBAction func choosingTypeOfRequest(_ sender: Any) {
        let index = segmentControll.selectedSegmentIndex
        let type = StocksType(rawValue: index)
        output.getStocks(type: type ?? .mostActive)
    }
    
    func hideMainUI() {
        segmentControll.isHidden = true
        tableView.isHidden = true
    }
    
    func showMainUI() {
        segmentControll.isHidden = false
        tableView.isHidden = false
    }
    
    func prepareForRequest() {
        hideMainUI()
        reconnectButton.isHidden = true
        activityIndicatorView.startAnimating()
    }
    
    func showStoks() {
        showMainUI()
        reconnectButton.isHidden = true
        activityIndicatorView.stopAnimating()
    }
    
    func reloadData(stocks: [Stock]) {
        displayManager?.reloadData(stocks)
    }
    
    func showReconnectButton() {
        segmentControll.isHidden = true
        tableView.isHidden = true
        reconnectButton.isHidden = false
        activityIndicatorView.stopAnimating()
    }
    
    @IBAction func reconnect(_ sender: Any) {
        let segmentIndex = segmentControll.selectedSegmentIndex
        let stocksType = StocksType(rawValue: segmentIndex) ?? .mostActive
        output.getStocks(type: stocksType)
    }
}

extension StocksViewController: StocksDisplayManagerDelegate {
    func stocksDisplayManager(_ stocksDisplayManager: StocksDisplayManager, didSelected stock: Stock) {
        self.stock = stock
        performSegue(withIdentifier: "detailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? DetailedViewController else { return }
        vc.stock = stock
    }
}
