//
//  NewsDetailsViewController.swift
//  NYNews
//
//  Created by gamal oraby on 15/01/2022.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var detailsImageContainer: UIView!
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var copyRightLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    var viewObj: DetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    private func setupView() {
        
        detailsImage.load(the: viewObj?.image ?? "")
        titleLabel.text = viewObj?.title
        textLabel.text = viewObj?.text
        
        copyRightLabel.text = "  \(viewObj?.copyRight ?? "")  "
        byLineLabel.text = viewObj?.byline
        sourceLabel.text = viewObj?.newsSource
    }
    
    private func setupUI() {
        detailsImageContainer.layer.cornerRadius = 5
        detailsImageContainer.layer.shadowColor = UIColor.black.cgColor
        detailsImageContainer.layer.shadowRadius = 5
        detailsImageContainer.layer.shadowOpacity = 1
        detailsImageContainer.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
