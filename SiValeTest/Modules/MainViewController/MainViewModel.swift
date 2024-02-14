//
//  MainViewModel.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    var hasSelectedItems: Dynamic<Bool> { get }
}

class MainViewModel: MainViewModelProtocol {
    
    var items: [MainModel] = []
    
    var hasSelectedItems: Dynamic<Bool>
    
    var selectedItems: [MainModel] {
        return items.filter({ $0.isSelected })
    }
    
    init() {
        items = MainModel.data.map({ $0 })
        self.hasSelectedItems = Dynamic(false)
    }
    
    func selectItem(_ item: Int) {
        items[item].isSelected = true
        hasSelectedItems.value = !selectedItems.isEmpty
    }
    
    func unSelectItem(_ item: Int) {
        items[item].isSelected = false
        hasSelectedItems.value = !selectedItems.isEmpty
    }
    
}
