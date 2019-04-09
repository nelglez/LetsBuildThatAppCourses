//
//  CoursesTableViewCell.swift
//  LetsBuildThatAppCourses
//
//  Created by Nelson Gonzalez on 4/9/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit
import SDWebImage

class CoursesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    var courses: Course? {
        didSet {
            updateViews()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        courseImageView.image = nil
    }
    
    func updateViews() {
        guard let courses = courses else {return}
        courseNameLabel.text = courses.name
        priceLabel.text = "$\(courses.price)"
        courseImageView.loadImage(courses.bannerUrl)
    }
    
}


extension UIImageView {
    func loadImage(_ urlString: String?, onSuccess: ((UIImage) -> Void)? = nil) {
        self.image = UIImage()
        guard let string = urlString else {return}
        guard let url = URL(string: string) else {return}
        
        self.sd_setImage(with: url) { (image, error, type, url) in
            if onSuccess != nil, error == nil {
                onSuccess!(image!)
            }
        }
        
    }
}
