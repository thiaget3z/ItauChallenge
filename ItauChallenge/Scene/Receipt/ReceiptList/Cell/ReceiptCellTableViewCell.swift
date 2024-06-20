//
//  ReceiptCellTableViewCell.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

//    Sua missão é desenvolver 2 telas, usando um json mockado que estamos enviando junto com esse descritivo.
//    - Tela de listagem de comprovantes, cada item na lista deve conter:
//        - Título (title)
//        - Nome do favorecido (receiverName)
//        - Valor (amount)
//        - Data (date)
//    Ao clicar no item da lista deverá redirecionar para a tela de detalhe de comprovante



import UIKit

class ReceiptCellTableViewCell: UITableViewCell {
    
    lazy var receiptTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.title
        return label
    }()
    
    lazy var receiverName: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = self.receipt?.name
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
            
            receiptTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            receiptTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            amount.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            amount.leadingAnchor.constraint(equalTo: receiptTitle.trailingAnchor, constant: 10),
            amount.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            receiverName.topAnchor.constraint(equalTo: receiptTitle.bottomAnchor, constant: 10),
            receiverName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            date.topAnchor.constraint(equalTo: receiverName.bottomAnchor, constant: 30),
            date.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureViews() {
        self.backgroundColor = .white
        receiptTitle.font = .boldSystemFont(ofSize: 22)
        amount.font = .boldSystemFont(ofSize: 22)
        
    }
    
}
