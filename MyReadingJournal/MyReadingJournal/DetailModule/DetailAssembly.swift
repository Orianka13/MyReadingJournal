//
//  DetailAssembly.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit

final class DetailAssembly {
    
    static func build() -> UIViewController {
        
        let presenter = DetailPresenter()
        let controller = DetailViewController(dependencies: .init(presenter: presenter))
        
        return controller
    }
}
