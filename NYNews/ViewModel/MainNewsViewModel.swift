//
//  MainNewsViewModel.swift
//  NYNews
//
//  Created by gamal oraby on 15/01/2022.
//

import Foundation
import Moya

class MainNewsViewModel: NSObject {
    
     var newsData : APIResponse! {
          didSet {
              self.bindEmployeeViewModelToController()
          }
      }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
    override init() {
        super.init()
       getData()
    }
    
    func createDetailsObj(detailsObj: APIResponse, index: Int) -> DetailsModel {
        let obj = DetailsModel()
        if detailsObj.results[index].media.count != 0 {
            obj.image = detailsObj.results[index].media[0].mediaMetadata[2].url
            obj.copyRight = detailsObj.results[index].media[0].copyright
        }
        obj.title = detailsObj.results[index].title
        obj.text = detailsObj.results[index].abstract
        obj.byline = detailsObj.results[index].byline
        obj.newsSource = "\(detailsObj.results[index].source)"
        return obj
    }
    
    func getData() {
        let provider = MoyaProvider<NewsListService>()
        provider.request(.getNewsData(key: "EOc1lLNob1onEJNyAwuNXgvJV5GAmFfv")) { result in
            switch result {
            case let .success(response):
                do {
                    let data =  response.data
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    self.newsData = result
                } catch {
                    print("error")
                }
            case let .failure(error):
                print("failure: \(error)")
            }
        }
    }
}
