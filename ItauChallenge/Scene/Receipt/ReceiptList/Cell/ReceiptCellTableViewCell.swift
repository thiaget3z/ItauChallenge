//
//  ReceiptCellTableViewCell.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

class ReceiptCellTableViewCell: UITableViewCell {
    
    lazy var receiptTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.title
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
    
    private var receipt: ReceiptEntity?
    
    func setupCell(receipt: ReceiptEntity) {
        self.receipt = receipt
        setupViewConfiguration()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

extension ReceiptCellTableViewCell: ViewCode {
    var subViews: [UIView] {
        [receiptTitle, receiverName, amount, date]
    }
    
    func setupConstraints() {
        let constraints = [
            
            receiptTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: Padding.paddingSmall),
            receiptTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            amount.topAnchor.constraint(equalTo: self.topAnchor, constant: Padding.paddingSmall),
            amount.leadingAnchor.constraint(equalTo: receiptTitle.trailingAnchor, constant: Padding.paddingSmall),
            amount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Padding.paddingMedium),
            
            receiverName.topAnchor.constraint(equalTo: receiptTitle.bottomAnchor, constant: Padding.paddingSmall),
            receiverName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
            date.topAnchor.constraint(equalTo: receiverName.bottomAnchor, constant: Padding.paddingLarge),
            date.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Padding.paddingMedium),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        self.selectionStyle = .none
        receiptTitle.font = .preferredFont(forTextStyle: .headline)
        amount.font = .preferredFont(forTextStyle: .headline)
        
    }
    
}
