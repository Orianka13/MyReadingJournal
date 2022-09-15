//
//  OnboardingCollectionViewCell.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 12.09.2022.
//

import UIKit

final class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlide) {
        self.slideImageView.image = slide.image
        self.slideTitleLabel.text = slide.title
        self.slideDescriptionLabel.text = slide.description
        
    }
}
