//
//  FavouritesViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var favouritesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesTableView.delegate = self
        favouritesTableView.dataSource = self
        // Do any additional setup after loading the view.
    }



}
extension FavouritesViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        return cell
    }
    
    
}
