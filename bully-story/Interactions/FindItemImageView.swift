//
//  FindItemImageView.swift
//  bully-story
//
//  Created by Cifran on 26/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

class FindItemImageView: UIView {
    @IBOutlet var contentView: UIView!
    
    @IBOutlet var items: [UIImageView]!
    @IBOutlet weak var lostBook: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    func commonInit() { Bundle.main.loadNibNamed("FindItemImageView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

}
