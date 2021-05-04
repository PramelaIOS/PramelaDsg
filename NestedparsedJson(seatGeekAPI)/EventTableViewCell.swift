//
//  EventTableViewCell.swift
//  NestedparsedJson(seatGeekAPI)
//
//  Created by Pramela on 4/28/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageLable: UIImageView!
    
    @IBOutlet weak var concertLabel: UILabel!
        
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
   // var jsonParsed:JasonResponse?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
