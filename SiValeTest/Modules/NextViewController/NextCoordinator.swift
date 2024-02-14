//
//  NextCoordinator.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class NextCoordinator: CoordinatorProtocol {
    
    var parentController: UIViewController!
    private var items: [MainModel]!
    
    init(parentController: UIViewController, items: [MainModel]) {
        self.parentController = parentController
        self.items = items
    }
    
    func start() {
        let repository = NextRepository()
        let viewModel = NextViewModel(repository: repository, items: items)
        let viewController = NextViewController.instantiate(fromStoryboard: "NextViewController")
        viewController.setupView(viewModel: viewModel)
        parentController.show(viewController, sender: nil)
    }
    
}
