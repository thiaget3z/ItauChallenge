//
//  ReceiptDetailView.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

// MARK: - ReceiptDetailView

class ReceiptDetailView: UIView {
    
    // MARK: - UI Elements
    
    lazy var receiptTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.title
        return label
    }()
    
    lazy var name: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.name
        return label
    }()
    
    lazy var receiverName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.receiverName
        return label
    }()
    
    lazy var amount: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.amount
        return label
    }()
    
    lazy var date: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.date
        return label
    }()
    
    lazy var receiptId: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.receiptId
        return label
    }()
    
    lazy var controlId: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.control
        return label
    }()
    
    var receipt: ReceiptDetail.RequestReceiptDetail.ViewModel?
    
    // MARK: - Initializers
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    func setupView(receipt: ReceiptDetail.RequestReceiptDetail.ViewModel) {
        self.receipt = receipt
        setupViewConfiguration()
    }
}

// MARK: - ViewCode Extension

extension ReceiptDetailView: ViewCode {
    
    var subViews: [UIView] {
        [receiptTitle, name, receiverName, amount, date, receiptId, controlId]
    }
    
    func setupConstraints() {
        
        let constraints = [
            receiptTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            receiptTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: Padding.paddingSmall),
            
            amount.topAnchor.constraint(equalTo: self.receiptTitle.bottomAnchor, constant: Padding.paddingLarge),
            amount.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            receiptId.topAnchor.constraint(equalTo: amount.bottomAnchor, constant: Padding.paddingLarge),
            receiptId.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            date.topAnchor.constraint(equalTo: receiptId.bottomAnchor, constant: Padding.paddingMedium),
            date.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            receiverName.topAnchor.constraint(equalTo: date.bottomAnchor, constant: Padding.paddingExtraLarge),
            receiverName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            name.topAnchor.constraint(equalTo: receiverName.bottomAnchor, constant: Padding.paddingMedium),
            name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            controlId.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Padding.paddingMedium),
            controlId.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        
        receiptTitle.font = .preferredFont(forTextStyle: .title1)
        receiptId.font = .preferredFont(forTextStyle: .headline)
        amount.font = .preferredFont(forTextStyle: .title2)
        controlId.font = .preferredFont(forTextStyle: .footnote)
        receiverName.font = .preferredFont(forTextStyle: .body)
        name.font = .preferredFont(forTextStyle: .body)
        
        controlId.textColor = .lightGray
    }
}
