//
//  ViewCode.swift
//  ItauChallenge
//
//  Created by Thiago Lima on 19/06/24.
//

import UIKit

protocol ViewCode: AnyObject {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
    func setupViewConfiguration()
    
    var subViews: [UIView] { get }
}

extension ViewCode {
    func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
}

extension ViewCode where Self: UIView {
    func buildViewHierarchy() {
        for view in subViews {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
