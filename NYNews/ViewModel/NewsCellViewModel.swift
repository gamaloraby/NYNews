//
//  NewsCellViewModel.swift
//  NYNews
//
//  Created by gamal oraby on 17/01/2022.
//

import Foundation

class NewsCellViewModel: NSObject {
    
     var newsData : NewsCellModel! {
          didSet {
              self.bindDataViewModelToController()
          }
      }
    
    var bindDataViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
       
    }
    
    func setData(with data: NewsCellModel) {
        self.newsData = data
    }
}
