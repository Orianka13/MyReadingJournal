//
//  DetailViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private enum Literal {
        static let navigationBarTitle = "Добавить книгу"
    }
    
    private enum Colors {
        static let buttonColor = UIColor(red: 1 / 255, green: 93 / 255, blue: 104 / 255, alpha: 1)
    }
    
    private enum Fonts {
        static let mainFont = UIFont(name: "KohinoorBangla-Regular", size: 18)
    }

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
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = Literal.navigationBarTitle
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Fonts.mainFont ?? UIFont.systemFont(ofSize: 18)]
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.tintColor = Colors.buttonColor
    }
    
    
}


