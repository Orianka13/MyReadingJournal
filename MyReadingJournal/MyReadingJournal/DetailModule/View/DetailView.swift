//
//  DetailView.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit
import SnapKit
import Cosmos

protocol IDetailView {
    
}

final class DetailView: UIView {
    
    private enum Literal {
        static let nameOfBook = "Название книги"
        static let author = "Автор"
        
    }
    
    private enum Fonts {
        
    }
    
    private enum Metrics {
        static let cornerRadius = CGFloat(10)
    }
    
    private enum Colors {
        static let mainColor = UIColor(red: 103/255, green: 222/255, blue: 165/255, alpha: 1)
        static let tfBackgroundColor: UIColor = .systemGray
        static let tftextColor: UIColor = .black
        static let buttonColor = UIColor(red: 1 / 255, green: 93 / 255, blue: 104 / 255, alpha: 1)
        static let ratingColor = UIColor(red: 208 / 255, green: 92 / 255, blue: 67 / 255, alpha: 1)
    }
    
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "placeholder")
        imageView.image = image
        imageView.alpha = 0.5
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.cornerRadius = Metrics.cornerRadius
        return imageView
    }()
    
    private lazy var nameOfBookTF: UITextField = {
        let tf = UITextField()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.placeholder = Literal.nameOfBook
        tf.backgroundColor = Colors.tfBackgroundColor
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.textColor = Colors.tftextColor
        return tf
    }()
    
    private lazy var authorTF: UITextField = {
        let tf = UITextField()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.placeholder = Literal.author
        tf.backgroundColor = Colors.tfBackgroundColor
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.textColor = Colors.tftextColor
        return tf
    }()
    
    private var dateFormatter: DateFormatter {
            let df = DateFormatter()
            df.dateFormat = "dd.MM.yy"
            return df
        }
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        let date = Date()
        label.text = "  " + dateFormatter.string(from: date)
        label.backgroundColor = Colors.tfBackgroundColor
        label.layer.cornerRadius = Metrics.cornerRadius
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var calendarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "calendar"), for: .normal)
        button.tintColor = Colors.buttonColor
        return button
    }()
    
    private lazy var ratingStars: CosmosView = {
        let rating = CosmosView()
        rating.settings.filledColor = Colors.ratingColor
        rating.settings.starSize = 30
        return rating
    }()
    
    private lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = Colors.buttonColor
        return button
    }()
    
    private lazy var uploadPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo"), for: .normal)
        button.tintColor = Colors.buttonColor
        return button
    }()
    
//    private lazy var photoStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.alignment = .center
//        stackView.distribution = .equalSpacing
//        stackView.spacing = 20
//        stackView.backgroundColor = Colors.tfBackgroundColor
//        stackView.addSubview(takePhotoButton)
//        stackView.addSubview(uploadPhotoButton)
//        return stackView
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
        self.makeConstraints()
        self.backgroundColor = Colors.mainColor
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

//MARK: Private extension

private extension DetailView {
    
    private func addSubviews() {
        self.addSubview(coverImage)
        self.addSubview(nameOfBookTF)
        self.addSubview(authorTF)
        self.addSubview(dateLabel)
        self.addSubview(calendarButton)
        self.addSubview(ratingStars)
        
        self.addSubview(takePhotoButton)
        self.addSubview(uploadPhotoButton)
    }
}

//MARK: - DetailViewLayout

private extension DetailView {
    
    private func makeConstraints() {
        self.coverImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.leading.equalToSuperview().inset(20)
            make.height.equalToSuperview().multipliedBy(0.25)
            make.width.equalToSuperview().multipliedBy(0.40)
        }
        
        self.nameOfBookTF.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        self.authorTF.snp.makeConstraints { make in
            make.top.equalTo(self.nameOfBookTF.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.authorTF.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalTo(self.calendarButton.snp.leading)
            make.height.equalTo(30)
        }
        
        self.calendarButton.snp.makeConstraints { make in
            make.top.equalTo(self.authorTF.snp.bottom).inset(-20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        self.ratingStars.snp.makeConstraints { make in
            make.top.equalTo(self.dateLabel.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(30)
        }


        self.takePhotoButton.snp.makeConstraints { make in

            make.top.equalTo(self.coverImage.snp.bottom).inset(-10)
            make.trailing.equalTo(self.coverImage.snp.centerX).inset(-10)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }

        self.uploadPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self.coverImage.snp.bottom).inset(-10)
            make.leading.equalTo(self.coverImage.snp.centerX).inset(10)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
}

//MARK: - IDetailView
extension DetailView: IDetailView {
    
}

