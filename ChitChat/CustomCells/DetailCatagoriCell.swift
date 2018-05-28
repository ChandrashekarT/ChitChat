//
//  DetailCatagoriCell.swift
//  ChitChat
//
//  Created by Epos Admin on 02/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class DetailCatagoriCell: UITableViewCell {
    
    @IBOutlet weak var topicNameLbl: UILabel!
    @IBOutlet weak var expertNameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var freeOrPaidLbl: UILabel!
    @IBOutlet weak var phoneBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //callBtn.layer.cornerRadius = 20
        //callBtn.clipsToBounds = true
        
        phoneBtn.layer.cornerRadius = 12
        phoneBtn.clipsToBounds = true
        phoneBtn.backgroundColor = UIColor.green
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
