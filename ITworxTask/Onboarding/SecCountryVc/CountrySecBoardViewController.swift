//
//  CountrySecBoardViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit

class CountrySecBoardViewController: UIViewController {
    var codeReturn: String?
    @IBOutlet weak var countryButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryButton.addTarget(self, action: #selector(countryTapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if codeReturn != nil{
            countryButton.setTitle(codeReturn, for: .normal)
        }
    }

    @objc func countryTapped(){
        print("tapped")
        let countryVc = CountryViewController()
        countryVc.modalPresentationStyle = .overFullScreen
        countryVc.countryChangedCalled = { country,code in
            print("code is here ,congrats\(country ),", code)
            self.codeReturn = country
            self.countryButton.setTitle(country, for: .normal)
            UserDefaults.standard.set(code, forKey: "country_id")
        }
        self.present(countryVc, animated: true, completion: nil)
        
       
    }
    
}
