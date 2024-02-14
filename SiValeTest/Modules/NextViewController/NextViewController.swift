//
//  NextViewController.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

class NextViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: NextViewModel!
    private var employees: [Employee]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBinds()
        viewModel.getEmployees()
    }
    
    func setupView(viewModel: NextViewModel) {
        self.viewModel = viewModel
        title = "Vista Secundaria"
    }
    
    private func setupBinds() {
        viewModel.employees.bind { [weak self] employees in
            self?.employees = employees
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        tableView.register(CameraTableViewCell.self)
        tableView.register(FullNameTableViewCell.self)
        tableView.register(PhoneNumberTableViewCell.self)
        tableView.register(BirthdayTableViewCell.self)
        tableView.register(GenderTableViewCell.self)
        tableView.register(FavoriteColorTableViewCell.self)
        tableView.register(EmployeesTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
    }

}

// MARK: - UITableViewDataSource
extension NextViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.items[section].cell.getTitle()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let cellType = viewModel.items[section].cell
        
        switch cellType {
        case .camera, .fullName, .phone, .birthday:
            return 1
        case .listOfEmployees:
            return employees?.count ?? .zero
        case .gender:
            return 2
        case .favoriteColor:
            return 5
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        let cellType = viewModel.items[indexPath.section].cell
        
        switch cellType {
        case .camera:
            
            let cameraCell = tableView.dequeueReusableCell(for: indexPath) as CameraTableViewCell
            return cameraCell
            
        case .listOfEmployees:
            
            let employeeCell = tableView.dequeueReusableCell(for: indexPath) as EmployeesTableViewCell
            employeeCell.setupView(id: viewModel.getEmployeeId(index),
                                   name: viewModel.getEmployeeName(index),
                                   lastName: viewModel.getEmployeeLastName(index),
                                   birthday: viewModel.getEmployeeBithday(index))
            return employeeCell
            
        case .fullName:
            
            let fullNameCell = tableView.dequeueReusableCell(for: indexPath) as FullNameTableViewCell
            return fullNameCell
            
        case .phone:
            
            let phoneCell = tableView.dequeueReusableCell(for: indexPath) as PhoneNumberTableViewCell
            return phoneCell
            
        case .birthday:
            
            let birthdayCell = tableView.dequeueReusableCell(for: indexPath) as BirthdayTableViewCell
            return birthdayCell
            
        case .gender:
            
            let genderCell = tableView.dequeueReusableCell(for: indexPath) as GenderTableViewCell
            genderCell.setupView(gender: viewModel.gender[indexPath.row])
            return genderCell
            
        case .favoriteColor:
            
            let favoriteColorCell = tableView.dequeueReusableCell(for: indexPath) as FavoriteColorTableViewCell
            favoriteColorCell.setupView(viewModel.colors[indexPath.row])
            return favoriteColorCell
            
        }
        
    }
    
}
