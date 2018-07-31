//
//  TutoialSliderViewController.swift
//  smartclub
//
//  Created by Admin on 05/12/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

//
//  AboutPageViewController.swift
//  Temp
//
//  Created by Admin on 20/11/2017.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import CHIPageControl


class TutorialSliderViewController : UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, SliderDelegate {
    
    //MARK: Properties
    fileprivate let CLASS_NAME = "TutorialSliderViewController"
    
    //MARK: Outlets
   // @IBOutlet weak var pageControl: CHIPageControlAji!
    @IBOutlet weak var pageControl: CHIPageControlAleppo!
    @IBOutlet weak var closeBtn:UIButton!
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    // The UIPageViewController
    var pageContainer: UIPageViewController!
    
    // The pages it contains
    var pages = [UIViewController]()
    
    // Track the current index
    var currentIndex: Int = 0
    private var pendingIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the pages
        let storyboard = UIStoryboard(name: "tutorial", bundle: nil)
        let page1: UIViewController! = storyboard.instantiateViewController(withIdentifier: "tt1")
        let page2: UIViewController! = storyboard.instantiateViewController(withIdentifier: "tt2")
        let page3: UIViewController! = storyboard.instantiateViewController(withIdentifier: "tt3")
        let page4: LastSliderViewController = storyboard.instantiateViewController(withIdentifier: "tt4") as! LastSliderViewController
        
        page4.delegate = self
        
        pages.append(page1)
        pages.append(page3)
        pages.append(page2)
        pages.append(page4)
        
        // Create the page container
        pageContainer = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageContainer.delegate = self
        pageContainer.dataSource = self
        pageContainer.setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        // Add it to the view
        view.addSubview(pageContainer.view)
        
        // Configure our custom pageControl
        view.bringSubview(toFront: pageControl)
        view.bringSubview(toFront: btnSkip)
        view.bringSubview(toFront: btnNext)
        // view.bringSubview(toFront:closeBtn)
        pageControl.numberOfPages = pages.count
    }
    
    
    //MARK:Actions
    //When click on next button
    @IBAction func onClickNextButton(_ sender: UIButton, forEvent event: UIEvent) {
        if currentIndex <= 2 {
            pageContainer.setViewControllers([pages[currentIndex+1]], direction: .forward, animated: true, completion: nil)
            pageControl.set(progress: currentIndex+1, animated: true)
            currentIndex = currentIndex+1
        } else {
//            let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
//            let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//            
//            //go to login view controller
//            self.present(loginViewController, animated: true, completion: nil)
            
        }
    }
    
    
    //when click on skip button
    @IBAction func onClickSkipButton(_ sender: UIButton, forEvent event: UIEvent) {
        
//        let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
//        let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
//
//        //go to login view controller
//        self.present(loginViewController, animated: true, completion: nil)
    }
    
    
    
    // MARK: - UIPageViewController delegates
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        currentIndex = pages.index(of: viewController)!
        if currentIndex == pages.count-1{
            return nil
        }
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    
    @IBAction func closebtnAction(sender:Any?) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.index(of: viewController)!
        if currentIndex == 0 {
            return nil
        }
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = pages.index(of: pendingViewControllers.first!)
        
        print(CLASS_NAME+" -- pageViewController() -- pendingViewControllers -- \(pendingIndex)")
        if pendingIndex == pages.count-1 {
            //            let loginStoryboard = UIStoryboard.init(name: "Login", bundle: nil)
            //            let loginViewController = loginStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            //
            //            //go to login view controller
            //            self.present(loginViewController, animated: true, completion: nil)
            
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            currentIndex = pendingIndex
            //            if let index = currentIndex {
            //                pageControl.set(progress: index, animated: true)
            pageControl.set(progress: currentIndex, animated: true)
            //            }
        }
        
    }
    
    //show buttons
    private func showButtons(){
        btnSkip.isHidden = false
        btnNext.isHidden = false
    }
    
    private func hideButtons(){
        btnSkip.isHidden = true
        btnNext.isHidden = true
    }
    
    //MARK: SliderDelegate
    func sliderLastpageDidAppear() {
        print(CLASS_NAME+" -- sliderLastpageDidAppear()")
        hideButtons()
    }
    
    func sliderLastpageDidDisappear() {
        print(CLASS_NAME+" -- sliderLastpageDidDisappear()")
        showButtons()
    }
}
