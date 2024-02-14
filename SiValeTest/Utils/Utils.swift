//
//  Utils.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

// MARK: - typealias

typealias ReusableTableView = UITableViewCell & ReusableView & NibLoadableView

// MARK: - protocols

protocol CoordinatorProtocol: AnyObject {
    var parentController: UIViewController! { get set }
    func start()
}
