//
//  PostTableViewCell.swift
//  Reddit_OBJ_GP
//
//  Created by Nathan Andrus on 2/13/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var postLandingPad: DVMPost? {
        didSet {
            DispatchQueue.main.async {
                self.updateViews()
            }
        }
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!

    func updateViews() {
        guard let post = postLandingPad else { return }
        titleLabel.text = post.title
        upsLabel.text = "\(post.ups) ups"
        commentCountLabel.text = "\(post.commentCount) comments"
    }
    
    
    
    
}
