//
//  ViewController.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 05.09.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var slides = [OnboardingSlide]()
    private var currentPage = 0 {
        didSet {
            if currentPage == self.slides.count - 1 {
                self.nextButton.setTitle("Get Started", for: .normal)
            } else {
                self.nextButton.setTitle("Next", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.slides = [OnboardingSlide(title: "Title1", description: "Description1", image: UIImage(named: "onb1") ?? UIImage()),
                       OnboardingSlide(title: "Title2", description: "Description2", image: UIImage(named: "onb2") ?? UIImage()),
                       OnboardingSlide(title: "Title3", description: "Description3", image: UIImage(named: "onb3") ?? UIImage())]
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
    }
}

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

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        self.currentPage = Int(scrollView.contentOffset.x / width)
        self.pageControl.currentPage = self.currentPage
        
    }
}

