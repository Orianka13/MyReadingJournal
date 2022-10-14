//
//  DetailViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {

    private let detailView: DetailView
    private let presenter: IDetailPresenter?
    
    struct Dependencies {
        let presenter: IDetailPresenter
    }
    
    init(dependencies: Dependencies) {
        self.detailView = DetailView(frame: UIScreen.main.bounds)
        self.presenter = dependencies.presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func loadView() {
        super.loadView()
        self.presenter?.loadView(controller: self, view: self.detailView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(detailView)
        title = "Добавить книгу"
    }
    
    
}


