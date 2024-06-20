//
//  ReceiptListRouter.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

@objc protocol ReceiptListRoutingLogic
{
  //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol ReceiptListDataPassing
{
  var dataStore: ReceiptListDataStore? { get }
}

class ReceiptListRouter: NSObject, ReceiptListRoutingLogic, ReceiptListDataPassing
{
  weak var viewController: ReceiptListViewController?
  var dataStore: ReceiptListDataStore?
  
  // MARK: Routing
  
  //func routeToSomewhere(segue: UIStoryboardSegue?)
  //{
  //  if let segue = segue {
  //    let destinationVC = segue.destination as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //  } else {
  //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
  //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
  //    var destinationDS = destinationVC.router!.dataStore!
  //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
  //    navigateToSomewhere(source: viewController!, destination: destinationVC)
  //  }
  //}

  // MARK: Navigation
  
  //func navigateToSomewhere(source: ReceiptListViewController, destination: SomewhereViewController)
  //{
  //  source.show(destination, sender: nil)
  //}
  
  // MARK: Passing data
  
  //func passDataToSomewhere(source: ReceiptListDataStore, destination: inout SomewhereDataStore)
  //{
  //  destination.name = source.name
  //}
}
