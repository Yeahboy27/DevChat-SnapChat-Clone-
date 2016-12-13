//
//  UserCell.swift
//  DevChat
//
//  Created by Mario Alberto Barragán Espinosa on 12/12/16.
//  Copyright © 2016 mario. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckMark(selected: false)
    }
    
    func updateUserUI(user: User) {
        
        firstNameLabel.text = user.firstName
    }
    
    func setCheckMark(selected: Bool) {

        let imageString = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageString))
    }
    

}
