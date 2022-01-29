//
//  TableViewCell.swift
//  CustomTableViewCell
//
//  Created by Ashish Ashish on 1/28/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgViewCell: UIImageView!
    
    @IBOutlet weak var lblCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
