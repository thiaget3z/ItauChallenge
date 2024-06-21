//
//  NavigationControllerSpy.swift
//  ItauChallengeTests
//
//  Created by Thiago Lima on 21/06/24.
//

import UIKit
@testable import ItauChallenge

class NavigationControllerSpy: UINavigationController {
    var didCallPush = false
    var viewControllerToPresent: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        didCallPush = true
        viewControllerToPresent = viewController
    }
}
