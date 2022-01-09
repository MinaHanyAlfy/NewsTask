//
//  CategoryTableViewCell.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
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
  
    var categories: [String:String] = ["business": "Business", "entertainment": "Entertainment", "general":  "General","health": "Health", "science" : "Science"  , "sports" : "Sports", "technology" : "Technology"]
    @IBOutlet weak var categoryTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.layer.masksToBounds = false
        contentView.layer.cornerRadius = 12
        contentView.backgroundColor = UIColor(named: "ColorOne")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func cellConfig(index: Int){
        switch index {
        case 0 :
            categoryTitleLabel.text = categories["business"]
            break
        case 1 :
            categoryTitleLabel.text = categories["entertainment"]
            break
        case 2 :
            categoryTitleLabel.text = categories["general"]
            break
        case 3 :
            categoryTitleLabel.text = categories["health"]
            break
        case 4 :
            categoryTitleLabel.text = categories["science"]
            break
        case 5 :
            categoryTitleLabel.text = categories["sports"]
            break
        case 6 :
            categoryTitleLabel.text = categories["technology"]
            break
        default:
            break
        }
    }
    
}
