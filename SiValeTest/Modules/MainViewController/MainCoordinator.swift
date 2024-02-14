//
//  MainCoordinator.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class MainCoordinator: CoordinatorProtocol {
    
    var parentController: UIViewController!
    
    init(parentController: UIViewController) {
        self.parentController = parentController
    }
    
    func start() {
        let viewModel = MainViewModel()
        let viewController = MainViewController.instantiate(fromStoryboard: "MainViewController")
        viewController.setupView(viewModel: viewModel)
        parentController.show(viewController, sender: nil)
    }
    
}
