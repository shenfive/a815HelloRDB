//
//  CommentTableViewCell.swift
//  a815HelloRDB
//
//  Created by 申潤五 on 2021/9/5.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var nickname: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
