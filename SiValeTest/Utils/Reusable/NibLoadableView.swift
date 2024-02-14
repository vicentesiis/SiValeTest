//
//  NibLoadableView.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String{
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIView {
    
    var nibName: String {
        return String(describing: type(of: self))
    }
    
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadNib() {
        guard let view = bundle.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            return
        }
        addSubview(view)
        constraints(to: view)
    }
    
}
