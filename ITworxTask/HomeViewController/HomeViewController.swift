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
    var isSearched : Bool = false
    var data : News?{
        didSet{
            DispatchQueue.main.async {
                //                print(self.data)
                self.newsTableView.reloadData()
            }
        }
    }
    let core = CoreDataLayer.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        searchBar.delegate = self
        title = "News"
        newsTableView.delegate = self
        newsTableView.dataSource = self
        registerCell()
        navigationBarHandle()
        //MARK: To favourite long press
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(favouriteArticalePressed(sender:)))
        newsTableView.addGestureRecognizer(longPress)
        // Do any additional setup after loading the view.
    }
    func navigationBarHandle(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(favouritTapped))
    }
    @objc func favouritTapped(){
        //        let vc =
        print("favourites")
        let vc = FavouritesViewController()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func favouriteArticalePressed(sender: UILongPressGestureRecognizer){
        print("Try Saving Artical")
        if sender.state == .began {
                let touchPoint = sender.location(in: newsTableView)
                if let indexPath = newsTableView.indexPathForRow(at: touchPoint) {
                    core.saveArtical(artical: data?.articles?[indexPath.row] ?? Article())
                    // your code here, get the row for the indexPath or do whatever you want
                }
            }

       
        
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
        cell.dateLabel.text = setDate(date: newsDetail.publishedAt ?? "")
        cell.descLabel.text = newsDetail.articleDescription
        cell.newsSourceLabel.text = newsDetail.source?.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = DetailsViewController()
        let newsDetail : Article = data?.articles?[indexPath.row] ?? Article()
        detailsVc.modalPresentationStyle = .fullScreen
        detailsVc.newsSource = newsDetail.source?.name ?? ""
        detailsVc.link = newsDetail.url
        navigationController?.pushViewController(detailsVc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 5 - 8
    }
    
    
}
extension UIViewController{
     func setDate(date: String)->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let newDate = dateFormatter.date(from: date) else { return ""}
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "MMM d, h:mm a"
        return newDateFormatter.string(from: newDate)
    }
}
extension HomeViewController{
    private func fetchData(){
        let countryCode : String = UserDefaults.standard.string(forKey: "country_id") ?? ""
        
        guard !isSearched else{
            NetworkLayer.shared.getResults(APICase: .search(code: searchBar.text ?? ""),decodingModel: News.self) { [weak self] (response) in
                switch response{
                case .success(let data):
                    self?.data = data
                    DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            return}
        NetworkLayer.shared.getResults(APICase: .getDefault(code: countryCode),decodingModel: News.self) { [weak self] (response) in
            switch response{
            case .success(let data):
                self?.data = data
                DispatchQueue.main.async {
                    self?.newsTableView.reloadData()
                }
         
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
extension HomeViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        isSearched = true
        fetchData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            isSearched = false
            fetchData()
        }
    }
}
