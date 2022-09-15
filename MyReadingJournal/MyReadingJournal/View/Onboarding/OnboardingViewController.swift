//
//  ViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 05.09.2022.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    private enum Literal {
        static let buttonTitle1 = "Начнем"
        static let buttonTitle2 = "далее"
        static let fontName = "KohinoorBangla-Regular"
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pageControllBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    
    private var slides = [OnboardingSlide]()
    private var currentPage = 0 {
        didSet {
            self.pageControl.currentPage = self.currentPage
            if currentPage == self.slides.count - 1 {
                self.nextButton.isHidden = false
                self.nextButton.setTitle(Literal.buttonTitle1, for: .normal)
            } else {
                self.nextButton.isHidden = true
                //self.nextButton.setTitle(Literal.buttonTitle2, for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.slides = OnboardingSlide.getSlides()
        
        self.nextButton.isHidden = true
        self.nextButton.titleLabel?.font = UIFont(name: Literal.fontName, size: 18)
        
        self.bottomConstraint.constant = self.view.frame.height / 20
        self.pageControllBottomConstraint.constant = self.view.frame.height / 20
        self.topImageConstraint.constant = self.view.frame.height / 10
        
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if self.currentPage == self.slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true)
            
        } else {
            self.currentPage += 1
            let indexPath = IndexPath(item: self.currentPage, section: 0)
            self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
}


// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setup(slides[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        self.currentPage = Int(scrollView.contentOffset.x / width)
    }
}

