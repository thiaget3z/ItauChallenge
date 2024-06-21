//
//  ReceiptListView.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import Foundation
import UIKit

// MARK: - Protocols

protocol ReceiptListViewDelegate: AnyObject {
    func didSelectReceipt(receipt: ReceiptEntity)
}

// MARK: - ReceiptListView

class ReceiptListView: UIView {
    
    // MARK: - Properties
    
    var receipts: [ReceiptEntity]? {
        didSet {
            DispatchQueue.main.async {
                self.receiptTableView.reloadData()
            }            
        }
    }
    
    private lazy var receiptTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReceiptCellTableViewCell.self, forCellReuseIdentifier: "ReceiptCell")
        return tableView
    }()
    
    weak var delegate: ReceiptListViewDelegate?
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
        setupViewConfiguration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource

extension ReceiptListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receipts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiptCell") as? ReceiptCellTableViewCell, let receipt = receipts?[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setupCell(receipt: receipt)
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ReceiptListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let receipt = receipts?[indexPath.row] else {
            return
        }
        delegate?.didSelectReceipt(receipt: receipt)
    }
}

// MARK: - ViewCode

extension ReceiptListView: ViewCode {
    var subViews: [UIView] {
        get {
            [receiptTableView]
        }
    }
    
    func setupConstraints() {
        let constraints = [
            receiptTableView.topAnchor.constraint(equalTo: self.topAnchor),
            receiptTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            receiptTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            receiptTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews() {
        self.backgroundColor = .white
    }
}
