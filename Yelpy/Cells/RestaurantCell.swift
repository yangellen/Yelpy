//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Ellen Yang on 5/1/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

   @IBOutlet weak var label: UILabel!
   @IBOutlet weak var restaurantImage: UIImageView!
   @IBOutlet weak var phone: UILabel!

   override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
