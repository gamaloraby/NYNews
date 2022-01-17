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
    
    var newsCellViewModel: NewsCellViewModel? = NewsCellViewModel()
    var cellData: NewsCellModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        updateViewModel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
    func updateViewModel() {
        self.newsCellViewModel?.bindDataViewModelToController = {
                  self.updateDataSource()
              }
    }
    
    func updateDataSource() {
        cellData = newsCellViewModel?.newsData
        configCell()
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

    func configCell() {
        cellImage.load(the: cellData?.image ?? "")
        cellLBL.text = cellData?.title
        publishedDate.text = cellData?.date
        sections.text = " \(cellData?.section ?? "")  "
    }
    
}
