//
//  DeviceCellTableViewCell.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//

import UIKit

class DeviceCellTableViewCell: UITableViewCell {

    public static let identifier = "DeviceCell"
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var identifierLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
