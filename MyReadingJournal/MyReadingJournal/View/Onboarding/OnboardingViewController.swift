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
            self.pageControl.currentPage = self.currentPage
            if currentPage == self.slides.count - 1 {
                self.nextButton.setTitle("начнем!", for: .normal)
            } else {
                self.nextButton.setTitle("далее", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.slides = [OnboardingSlide(title: "Читательский дневник",
                                       description: "Добавляй заметки о прочитанных книгах, любимые цитаты, свои впечатления и мысли.",
                                       image: UIImage(named: "onb1") ?? UIImage()),
                       OnboardingSlide(title: "Избранное",
                                       description: "Сохраняй в избранное понравившиеся произведения, чтобы они всегда были под рукой!",
                                       image: UIImage(named: "onb2") ?? UIImage()),
                       OnboardingSlide(title: "Список книг",
                                       description: "Формируй список книг, которые хотел бы прочитать и составляй свои кастомные списки.",
                                       image: UIImage(named: "onb3") ?? UIImage())]
        
        self.nextButton.titleLabel?.font = UIFont(name: "KohinoorBangla-Regular", size: 18)
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
    }
}

