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
        static let description = "Мои впечатления / цитаты:"
        static let saveButtonTitle = "Сохранить"
        static let placeholderImageName = "placeholder"
        static let calendarImageName = "calendar"
        static let takePhotoImageName = "camera"
        static let uploadPhotoImageName = "photo"
    }
    
    private enum Fonts {
        static let mainFont = UIFont(name: "KohinoorBangla-Regular", size: 16)
    }
    
    private enum Metrics {
        static let cornerRadius = CGFloat(10)
    }
    
    private enum Colors {
        static let mainColor: UIColor = .white
        static let tfBackgroundColor = UIColor(red: 1 / 255, green: 93 / 255, blue: 104 / 255, alpha: 0.2)
        static let tftextColor: UIColor = .black
        static let buttonColor = UIColor(red: 1 / 255, green: 93 / 255, blue: 104 / 255, alpha: 1)
        static let ratingColor = UIColor(red: 208 / 255, green: 92 / 255, blue: 67 / 255, alpha: 1)
    }
    
    private lazy var coverImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: Literal.placeholderImageName)
        imageView.image = image
        imageView.alpha = 1
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.cornerRadius = Metrics.cornerRadius
        return imageView
    }()
    
    private lazy var nameOfBookTF: UITextField = {
        let tf = UITextField()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0,
                                           width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.font = Fonts.mainFont
        tf.placeholder = Literal.nameOfBook
        tf.backgroundColor = Colors.tfBackgroundColor
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.textColor = Colors.tftextColor
        return tf
    }()
    
    private lazy var authorTF: UITextField = {
        let tf = UITextField()
        tf.leftView = UIView(frame: CGRect(x: 0, y: 0,
                                           width: 10, height: tf.frame.height))
        tf.leftViewMode = .always
        tf.font = Fonts.mainFont
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
        label.font = Fonts.mainFont
        label.backgroundColor = Colors.tfBackgroundColor
        label.layer.cornerRadius = Metrics.cornerRadius
        label.layer.masksToBounds = true
        return label
    }()
    
    private lazy var calendarButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: Literal.calendarImageName)
        button.setImage(image, for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 26),
                                               forImageIn: .normal)
        button.tintColor = Colors.buttonColor
        return button
    }()
    
    private lazy var ratingStars: CosmosView = {
        let rating = CosmosView()
        rating.settings.filledColor = Colors.ratingColor
        rating.settings.emptyBorderColor = Colors.ratingColor
        rating.settings.starSize = 30
        rating.settings.emptyBorderWidth = 2
        return rating
    }()
    
    private lazy var takePhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Literal.takePhotoImageName),
                        for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20),
                                               forImageIn: .normal)
        button.tintColor = Colors.buttonColor
        button.backgroundColor = Colors.tfBackgroundColor
        button.layer.cornerRadius = Metrics.cornerRadius
        return button
    }()
    
    private lazy var uploadPhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Literal.uploadPhotoImageName),
                        for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 20),
                                               forImageIn: .normal)
        button.tintColor = Colors.buttonColor
        button.backgroundColor = Colors.tfBackgroundColor
        button.layer.cornerRadius = Metrics.cornerRadius
        return button
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.mainFont
        label.text = Literal.description
        label.textColor = Colors.tftextColor
        return label
    }()
    
    private lazy var descriptionTV: UITextView = {
        let tf = UITextView()
        tf.font = Fonts.mainFont
        tf.backgroundColor = Colors.tfBackgroundColor
        tf.layer.cornerRadius = Metrics.cornerRadius
        tf.textColor = Colors.tftextColor
        return tf
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle(Literal.saveButtonTitle, for: .normal)
        button.tintColor = Colors.buttonColor
        button.titleLabel?.font = Fonts.mainFont
        button.backgroundColor = Colors.buttonColor
        button.layer.cornerRadius = Metrics.cornerRadius
        return button
    }()
    
    
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
        self.addSubview(descriptionLabel)
        self.addSubview(descriptionTV)
        self.addSubview(saveButton)
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
            make.height.equalTo(35)
        }
        
        self.authorTF.snp.makeConstraints { make in
            make.top.equalTo(self.nameOfBookTF.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }
        
        self.dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self.authorTF.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalTo(self.calendarButton.snp.leading)
            make.height.equalTo(35)
        }
        
        self.calendarButton.snp.makeConstraints { make in
            make.top.equalTo(self.authorTF.snp.bottom).inset(-20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
            make.width.equalTo(30)
        }
        
        self.ratingStars.snp.makeConstraints { make in
            make.top.equalTo(self.dateLabel.snp.bottom).inset(-20)
            make.leading.equalTo(self.coverImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(35)
        }

        self.takePhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self.coverImage.snp.bottom).inset(-5)
            make.trailing.equalTo(self.coverImage.snp.centerX).offset(-10)
            make.height.equalTo(self.coverImage.snp.width).dividedBy(4)
            make.width.equalTo(self.coverImage.snp.width).dividedBy(3)
        }

        self.uploadPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self.coverImage.snp.bottom).inset(-5)
            make.leading.equalTo(self.coverImage.snp.centerX).offset(10)
            make.height.equalTo(self.coverImage.snp.width).dividedBy(4)
            make.width.equalTo(self.coverImage.snp.width).dividedBy(3)
        }
        
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.uploadPhotoButton.snp.bottom).inset(-20)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        self.descriptionTV.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLabel.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalToSuperview().dividedBy(3.5)
        }
        
        self.saveButton.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionTV.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
}

//MARK: - IDetailView
extension DetailView: IDetailView {
    
}

