//
//  Storyboard+Extensions.swift
//  SiValeTest
//
//  Created by Vicente Cantú on 14/02/24.
//

import UIKit

protocol Storyboarded {
    static func instantiate(fromStoryboard nibName: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(fromStoryboard nibName: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: nibName, bundle: Bundle(for: Self.self))
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}

