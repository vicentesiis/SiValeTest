//
//  MainViewController.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    
    private var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinds()
    }
    
    @IBAction func nextDidSelect(_ sender: Any) {
        let nextCoordinator = NextCoordinator.init(parentController: self, items: viewModel.selectedItems)
        nextCoordinator.start()
    }
    
    func setupView(viewModel: MainViewModel) {
        self.viewModel = viewModel
        title = "Vista Principal"
    }
    
    private func setupBinds() {
        viewModel.hasSelectedItems.bind { [weak self] hasSelectedItems in
            self?.nextButton.isEnabled = hasSelectedItems
        }
    }
    
    private func setupTableView() {
        tableView.register(MainTableViewCell.self)
        tableView.allowsMultipleSelection = true
    }
    
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mainTableViewCell = tableView.dequeueReusableCell(for: indexPath) as MainTableViewCell
        mainTableViewCell.setupView(with: viewModel.items[indexPath.row])
        
        if viewModel.items[indexPath.row].isSelected {
            if !mainTableViewCell.isSelected {
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        } else {
            if mainTableViewCell.isSelected {
                tableView.deselectRow(at: indexPath, animated: false)
            }
        }
        
        return mainTableViewCell
    }
    
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectItem(indexPath.row)
        
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        viewModel.unSelectItem(indexPath.row)
    }
    
}
