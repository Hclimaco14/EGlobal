//
//  RegisterCell.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//

import UIKit

class RegisterCell: UITableViewCell {

    public static let identifier = "RegisterCell"
    
    @IBOutlet weak var firstNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
