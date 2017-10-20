//
//  PersonTableViewCell.swift
//  Contact Card
//
//  Created by Mathieu Knook on 19/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
