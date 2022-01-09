//
//  CountryViewController.swift
//  ITworxTask
//
//  Created by John Doe on 2022-01-09.
//

import UIKit
typealias callBack = (String,String) -> Void
@available(iOS 13.0, *)
class CountryViewController: UIViewController {
    @IBOutlet weak var uaeCodeLB: UILabel!
    @IBOutlet weak var iraqCodeLB: UILabel!
    
    @IBOutlet weak var omanCodeLB: UILabel!
    @IBOutlet weak var libyaCodeLB: UILabel!
    @IBOutlet weak var sudanCodeLB: UILabel!
    @IBOutlet weak var jordanCodeLB: UILabel!
    @IBOutlet weak var lebanonCodeLB: UILabel!
    @IBOutlet weak var saudiCodeLB: UILabel!
    @IBOutlet weak var egyptCodeLB: UILabel!
    @IBOutlet weak var egyptView: UIView!
    @IBOutlet weak var saudiView: UIView!
    @IBOutlet weak var libyaView: UIView!
    @IBOutlet weak var sudanView: UIView!
    @IBOutlet weak var lebanonView: UIView!
    @IBOutlet weak var jodranView: UIView!
    @IBOutlet weak var omanView: UIView!
    @IBOutlet weak var iraqView: UIView!
    @IBOutlet weak var uaeView: UIView!
    var countryCode: String?
    var countryChangedCalled: callBack?
    var vc : CountrySecBoardViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
//        hideViewControllerWhenTappedAround()
        handleViewClicks()
        // Do any additional setup after loading the view.
    }
    func handleViewClicks(){
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped))
        let gesture1:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped1))
        let gesture2:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped2))
        let gesture3:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped3))
        let gesture4:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped4))
        let gesture5:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped5))
        let gesture6:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped6))
        let gesture7:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped7))
        let gesture8:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(targetViewDidTapped8))

        egyptView?.isUserInteractionEnabled = true
        egyptView?.addGestureRecognizer(gesture)
        saudiView?.isUserInteractionEnabled = true
        saudiView?.addGestureRecognizer(gesture1)
        libyaView?.isUserInteractionEnabled = true
        libyaView?.addGestureRecognizer(gesture2)
        lebanonView?.isUserInteractionEnabled = true
        lebanonView?.addGestureRecognizer(gesture3)
        sudanView?.isUserInteractionEnabled = true
        sudanView?.addGestureRecognizer(gesture4)
        jodranView?.isUserInteractionEnabled = true
        jodranView?.addGestureRecognizer(gesture5)
        omanView?.isUserInteractionEnabled = true
        omanView?.addGestureRecognizer(gesture6)
        iraqView?.isUserInteractionEnabled = true
        iraqView?.addGestureRecognizer(gesture7)
        uaeView?.isUserInteractionEnabled = true
        uaeView?.addGestureRecognizer(gesture8)
    }
    @objc func targetViewDidTapped(){
        print("egyptView")
        countryCode = egyptCodeLB.text
        vc?.codeReturn = countryCode

        if let countryChanged = countryChangedCalled{
            countryChanged(countryCode ?? "+0","eg")
        }
        self.dismiss(animated: true, completion: nil)
        }
    
@objc func targetViewDidTapped1(){
    print("saudiView")
    countryCode = saudiCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","sa")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped2(){
    print("libyaView")
    countryCode = libyaCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","ly")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped3(){
    print("lebanonView")
    countryCode = lebanonCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","lb")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped4(){
    print("sudanView")
    countryCode = sudanCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","sd")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped5(){
    print("jodranView")
    
    countryCode = jordanCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","jo")
    }
    self.dismiss(animated: true, completion: nil)
}
    
@objc func targetViewDidTapped6(){
    print("omanView")
    countryCode = omanCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","om")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped7(){
    print("iraqView")
    countryCode = iraqCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","iq")
    }
    self.dismiss(animated: true, completion: nil)
}
@objc func targetViewDidTapped8(){
    print("uaeView")
    countryCode = uaeCodeLB.text
    vc?.codeReturn = countryCode
    if let countryChanged = countryChangedCalled{
        countryChanged(countryCode ?? "+0","ae")
    }
    self.dismiss(animated: true, completion: nil)
}
    

}
