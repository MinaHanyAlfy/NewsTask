//
//  HomeViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-08.
//

import UIKit
import SDWebImage
class HomeViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var data : News?{
        didSet{
            DispatchQueue.main.async {
//                print(self.data)
                self.newsTableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        registerCell()
        // Do any additional setup after loading the view.
    }
    //Register CollectionViewCell
    func registerCell(){
        newsTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }

 

}
extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let newsDetail : Article = data?.articles?[indexPath.row] ?? Article()
        cell.newsImageView.sd_setImage(with: URL(string: newsDetail.urlToImage ?? "https://www.portseattle.org/sites/default/files/styles/detailpageimagesize/public/2021-02/paper-3327315_1920_16x9.jpg?itok=4zrV2FND"), placeholderImage: UIImage(named: "dollar_icon"))
        cell.titleLabel.text = newsDetail.title
        cell.dateLabel.text = newsDetail.publishedAt
        cell.descLabel.text = newsDetail.articleDescription
        cell.newsSourceLabel.text = newsDetail.source?.name
    return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4 - 16
    }
 
    
}
extension HomeViewController{
    private func fetchData(){
        NetworkLayer.shared.getResults(APICase: .getDefault(code: "ua"),decodingModel: News.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
