//
//  DetailModel.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 14.10.2022.
//

import UIKit

protocol IBookDetails {
  
}

struct BookDetails {
    let image: UIImage?
    let nameOfBook: String
    let author: String
    let date: Date
    let rating: Int
    let description: String?
}

// MARK: - IBookDetails
extension BookDetails: IBookDetails {
 
}
