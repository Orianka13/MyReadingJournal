//
//  DetailPresenter.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import Foundation

protocol IDetailPresenter {
    func loadView(controller: DetailViewController, view: IDetailView)
}

final class DetailPresenter {
    
    private enum Literal {
    }
    
    private weak var controller: DetailViewController?
    private var view: IDetailView?
    
}

//MARK: - Private extension

private extension DetailPresenter {
    
    func setHandlers() {

    }
}

//MARK: - IDetailPresenter

extension DetailPresenter: IDetailPresenter {
    func loadView(controller: DetailViewController, view: IDetailView) {
        self.controller = controller
        self.view = view
        self.setHandlers()
    }
}
