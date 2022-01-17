//
//  MainListCell.swift
//  NYNews
//
//  Created by gamal oraby on 15/01/2022.
//

import UIKit

class MainListCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLBL: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var sections: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
    private func setupUI() {
        cellImage.layer.cornerRadius = 5
        cellImage.layer.shadowColor = UIColor.black.cgColor
        cellImage.layer.shadowRadius = 5
        cellImage.layer.shadowOpacity = 1
        cellImage.layer.shadowOffset = CGSize(width: 0, height: 0)
        sections.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = 5
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowRadius = 5
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func configCell(imageUrl: String, Title: String, date: String, section: String) {
        cellImage.load(the: imageUrl) {
            print("completed ")
        }
        cellLBL.text = Title
        publishedDate.text = date
        sections.text = " \(section)  "
    }
    
}
