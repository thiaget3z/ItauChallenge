//
//  ReceiptListViewController.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

protocol ReceiptListDisplayLogic: AnyObject
{
    func displayReceipt(viewModel: ReceiptList.FetchReceipts.ViewModel)
}

class ReceiptListViewController: UIViewController, ReceiptListDisplayLogic
{
    
    let receiptView = ReceiptListView()
    
    var interactor: ReceiptListBusinessLogic?
    var router: (NSObjectProtocol & ReceiptListRoutingLogic & ReceiptListDataPassing)?
    
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
        let interactor = ReceiptListInteractor()
        let presenter = ReceiptListPresenter()
        let router = ReceiptListRouter()
        self.interactor = interactor
        self.router = router
        interactor.worker = ReceiptListWorker()
        interactor.presenter = presenter
        presenter.viewController = self
        router.viewController = self
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
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
