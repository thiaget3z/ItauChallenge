//
//  ReceiptDetailViewController.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.

import UIKit

protocol ReceiptDetailDisplayLogic: AnyObject {
    func displayReceipt(viewModel: ReceiptDetail.RequestReceiptDetail.ViewModel)
}

class ReceiptDetailViewController: UIViewController, ReceiptDetailDisplayLogic {
   
    private var interactor: ReceiptDetailBusinessLogic?
    
    var receiptDetailView = ReceiptDetailView()
    var router: (ReceiptDetailRoutingLogic & ReceiptDetailDataPassing)?
    
    // MARK: Object lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = receiptDetailView
    }
    
    // MARK: Setup
    
    private func setup() {
        let presenter = ReceiptDetailPresenter(viewController: self)
        let interactor = ReceiptDetailInteractor(presenter: presenter)
        let router = ReceiptDetailRouter(viewController: self)
        
        router.dataStore = interactor
        interactor.presenter = presenter
        presenter.viewController = self
        
        self.router = router
        self.interactor = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.requestReceipt(request: ReceiptDetail.RequestReceiptDetail.Request())
    }
    
    func displayReceipt(viewModel: ReceiptDetail.RequestReceiptDetail.ViewModel) {
        receiptDetailView.setupView(receipt: viewModel)
    }
}
