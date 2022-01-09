//
//  GetStartedViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var categoriesTableView: UITableView!
    var firstCat: String?
    var secondCat: String?
    var thirdCat: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        //Register Cell
        getStartedButton.isHidden = true
        getStartedButton.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        categoriesTableView.layer.cornerRadius = 12
    }
    func registerCell(){
        categoriesTableView.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoryTableViewCell")
    }

}
extension GetStartedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as! CategoryTableViewCell
        cell.cellConfig(index: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 5 - 8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categoriesTableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        if tableView.indexPathsForSelectedRows?.count == 3 {
            getStartedButton.isHidden = false
            
        }

        
    }
}
extension GetStartedViewController{
    @objc func getStartedTapped(){
        let nav = UINavigationController(rootViewController: HomeViewController())
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true, completion: nil)
    }
}
