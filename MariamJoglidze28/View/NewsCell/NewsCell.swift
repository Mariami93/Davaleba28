//
//  NewsCell.swift
//  MariamJoglidze28
//
//  Created by AltaSoftware MacMINI on 6/8/21.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()


        self.newsImage.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(with item: NewsViewModel) {
        newsImage.kf.setImage(with: item.imageUrl)
        titleLabel.text = item.title
        contentLabel.text = item.description
        dateLabel.text = item.date
    }
}
