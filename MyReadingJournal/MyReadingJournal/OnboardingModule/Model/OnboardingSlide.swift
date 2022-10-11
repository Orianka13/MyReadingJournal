//
//  OnboardingSlide.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 12.09.2022.
//

import UIKit

struct OnboardingSlide {
    let title: String
    let description: String
    let image: UIImage
    
    static func getSlides() -> [OnboardingSlide] {
        return [OnboardingSlide(title: "Читательский дневник",
                                description: "Добавляй заметки о прочитанных книгах, любимые цитаты, свои впечатления и мысли.",
                                image: UIImage(named: "onb1") ?? UIImage()),
                OnboardingSlide(title: "Избранное",
                                description: "Сохраняй в избранное понравившиеся произведения, чтобы они всегда были под рукой!",
                                image: UIImage(named: "onb2") ?? UIImage()),
                OnboardingSlide(title: "Список книг",
                                description: "Формируй список книг, которые хотел бы прочитать и составляй свои кастомные списки.",
                                image: UIImage(named: "onb3") ?? UIImage())
        ]
    }
}
