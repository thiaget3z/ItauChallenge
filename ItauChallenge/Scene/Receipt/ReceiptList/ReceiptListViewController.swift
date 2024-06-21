//
//  ReceiptListViewController.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

protocol ReceiptListDisplayLogic: AnyObject {
    func displayReceipt(viewModel: ReceiptList.FetchReceipts.ViewModel)
}

class ReceiptListViewController: UIViewController, ReceiptListDisplayLogic {
    
    let receiptView = ReceiptListView()
    
    var interactor: ReceiptListBusinessLogic?
    var router: (ReceiptListRoutingLogic & ReceiptListDataPassing)?
    
    // MARK: Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = receiptView
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let presenter = ReceiptListPresenter(viewController: self)
        let interactor = ReceiptListInteractor(presenter: presenter, worker: ReceiptListWorker())
        let router = ReceiptListRouter(viewController: self, dataStore: interactor)
        self.interactor = interactor
        self.router = router
        receiptView.delegate = self
        title = LocalizableStrings.receiptListTitle.localized()
    }

    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let request = ReceiptList.FetchReceipts.Request()
        interactor?.requestReceipt(request: request)
    }
    
    func displayReceipt(viewModel: ReceiptList.FetchReceipts.ViewModel) {
        receiptView.receipts = viewModel.displayReceipts
    }
}

extension ReceiptListViewController: ReceiptListViewDelegate {
    
    // MARK: Routing
    
    func didSelectReceipt(receipt: ReceiptEntity) {
        router?.routeToDetail(receiptEntity: receipt)
    }
    
}
