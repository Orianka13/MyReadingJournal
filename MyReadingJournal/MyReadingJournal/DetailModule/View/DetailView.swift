//
//  DetailView.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit

protocol IDetailView {

}

final class DetailView: UIView {
    
    private enum Literal {

    }
    
    private enum Fonts {
    
    }
    
    private enum Metrics {

    }
    
    private enum Colors {
        static let mainColor = UIColor(red: 103/255, green: 222/255, blue: 165/255, alpha: 1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addView()
        self.setConstraint()
        self.backgroundColor = Colors.mainColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: Private extension

private extension DetailView {
    
    private func addView() {

    }
    
    private func setConstraint() {

    }
}

//MARK: - DetailViewLayout

private extension DetailView {
    
}

//MARK: - IAuthView
extension DetailView: IDetailView {
    
}

