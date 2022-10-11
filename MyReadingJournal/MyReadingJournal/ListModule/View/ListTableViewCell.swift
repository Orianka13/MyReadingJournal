//
//  ListTableViewCell.swift
//  MyReadingJournal
//
//  Created by Олеся Егорова on 11.10.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
   
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var nameOfBook: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var descriptionOfBook: UILabel!
    @IBOutlet weak var dateOfReading: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
