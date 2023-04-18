//
//  UserTableViewCell.swift
//  RizzTracker
//
//  Created by User on 4/7/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var overallNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    var ownerOverall: Int = -1
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // fetch user data
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func config(with user: PFUser){
        print("Table View Cell")
        userNameLabel.text = "hello"//make api call that gets all users username
        overallNameLabel.text = "world"//make api call that gets all users overall rizz by their username
    }

}
