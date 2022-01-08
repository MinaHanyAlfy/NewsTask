//
//  NewsTableViewCell.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-08.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    override open var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 10
            frame.origin.x += 10
            frame.size.height -= 15
            frame.size.width -= 2 * 10
            super.frame = frame
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = 8
        
        contentView.backgroundColor = .secondarySystemBackground
        
        newsImageView.frame.size.height = newsImageView.frame.width
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = 12
//        watchNowButton.applyGradient(colours: [firstColor ,secondColor])
        super.layoutSubviews()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
