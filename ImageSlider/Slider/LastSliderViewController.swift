//
//  SliderFourViewController.swift
//  smartclub
//
//  Created by Mac-Admin on 4/15/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit


protocol SliderDelegate:NSObjectProtocol {
    func sliderLastpageDidAppear()->Void
    func sliderLastpageDidDisappear()->Void
}

class LastSliderViewController: UIViewController {
    
    //MARK: Properties
    open var delegate:SliderDelegate!
    
    //MARK:Outlets
    //@IBOutlet weak var btnGetStarted: UIBorderButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        delegate.sliderLastpageDidAppear()
    }
    override func viewDidDisappear(_ animated: Bool) {
        delegate.sliderLastpageDidDisappear()
    }
    
    //MARK: Actions
    //when click on get started button
  //  @IBAction func onClickGetStarted(_ sender: UIBorderButton) {
//        let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
//        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//        
//        //go to login view controller
//        self.present(loginViewController, animated: true, completion: nil)
 //   }
    
    
}
