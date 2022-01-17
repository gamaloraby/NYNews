//
//  MainNewsViewController.swift
//  NYNews
//
//  Created by gamal oraby on 13/01/2022.
//

import UIKit
import Moya
class MainNewsViewController: UIViewController {

    @IBOutlet weak var mainNewsList: UITableView!
    private var mainNewsViewModel: MainNewsViewModel!
    private var data: APIResponse?
    override func viewDidLoad() {
        consumeServices()
        updateViewModel()
    }
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    func updateViewModel() {
        self.mainNewsViewModel = MainNewsViewModel()
        self.mainNewsViewModel.bindEmployeeViewModelToController = {
                  self.updateDataSource()
              }
    }
    func updateDataSource() {
        data = self.mainNewsViewModel.newsData
        mainNewsList.reloadData()
    }
    private func consumeServices() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        mainNewsList.dataSource = self
        mainNewsList.delegate = self
        mainNewsList.register(UINib(nibName: "MainListCell", bundle: nil), forCellReuseIdentifier: "MainListCell")
    }
}

extension MainNewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  data?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainListCell", for: indexPath) as! MainListCell
        var url: String?
        if data?.results[indexPath.row].media.count != 0 {
             url = data?.results[indexPath.row].media[0].mediaMetadata[2].url ?? ""
        }
        let title = data?.results[indexPath.row].title ?? ""
        let date = data?.results[indexPath.row].publishedDate ?? ""
        let section = data?.results[indexPath.row].section ?? ""
        cell.configCell(imageUrl: url ?? "", Title: title, date: date, section: section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let response = data else {return}
        let  vc =  NewsDetailsViewController(nibName:"NewsDetailsViewController",bundle:Bundle.main)
        let detailsObj = mainNewsViewModel.createDetailsObj(detailsObj: response, index: indexPath.row)
        vc.viewObj = detailsObj
            if let navigator = self.navigationController {
                navigator.pushViewController(vc, animated: true)
            }else{
                let navigation  = UINavigationController(rootViewController:vc)
                self.present(navigation, animated: true, completion: nil)
            }
    }
}
