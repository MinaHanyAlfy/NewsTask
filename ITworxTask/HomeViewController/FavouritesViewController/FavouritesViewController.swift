//
//  FavouritesViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit
import SDWebImage
class FavouritesViewController: UIViewController {

    @IBOutlet weak var favouritesTableView: UITableView!
    let core = CoreDataLayer.shared
    var articals : [ArticalCD]?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favourites"
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
       articals = core.getArticals()
        registerCell()
        self.favouritesTableView.allowsMultipleSelectionDuringEditing = false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        if articals?.count ?? 0 > 0 {
            self.favouritesTableView.reloadData()
        }else {
            let alert = UIAlertController(title: "Alert", message: "There's no Favourites", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
                    self.navigationController?.popViewController(animated: true)
                }))
                present(alert, animated: true, completion: nil)
        }
    }
    func registerCell(){
        favouritesTableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
    }


}
extension FavouritesViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articals?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
        let newsDetail = articals?[indexPath.row]
        cell.newsImageView.sd_setImage(with: URL(string: newsDetail?.urlImage ?? "https://www.portseattle.org/sites/default/files/styles/detailpageimagesize/public/2021-02/paper-3327315_1920_16x9.jpg?itok=4zrV2FND"), placeholderImage: UIImage(named: "dollar_icon"))
        cell.titleLabel.text = newsDetail?.title
        cell.dateLabel.text = setDate(date: newsDetail?.date ?? "")
        cell.descLabel.text = newsDetail?.desc
        cell.newsSourceLabel.text = newsDetail?.nameSource
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

           if editingStyle == .delete {
               let newsDetail = articals?[indexPath.row]
               // remove the item from the data model
               articals?.remove(at: indexPath.row)
            
               // delete the table view row
               favouritesTableView.deleteRows(at: [indexPath], with: .fade)
               core.deleteArtical(title: newsDetail?.title ?? "" )
           } else if editingStyle == .insert {
               // Not used in our example, but if you were adding a new row, this is where you would do it.
           }
       }
}
