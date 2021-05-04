//
//  EventViewController.swift
//  NestedparsedJson(seatGeekAPI)
//
//  Created by Pramela on 4/28/21.
//

import UIKit
import Kingfisher

class EventViewController: UIViewController {

    @IBOutlet weak var eventTitleLabel: UILabel!
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var eventAddressLabel: UILabel!
    
    var event : JasonResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventAddressLabel.text =  event?.venue
        eventTitleLabel.text =  event?.title
        let  url =  URL( string:   event!.image)
       
        eventImageView.kf.setImage(with: url)

    }

    
    @IBAction func barButton(_ sender: Any) {
        
    }
}
