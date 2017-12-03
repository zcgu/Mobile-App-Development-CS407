//
//  PageViewController.swift
//  CS407hw2
//
//  Created by Zhicheng on 3/2/16.
//  Copyright © 2016 zhicheng. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {

    var orderedViewControllers: [UIViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        delegate = self
        automaticallyAdjustsScrollViewInsets = false
        navigationController!.navigationBar.translucent = false;
        
        orderedViewControllers = [newMonthViewController(0),
            newMonthViewController(1),
            newMonthViewController(-1)]
        
        // Do any additional setup after loading the view.
        if let firstViewController = orderedViewControllers!.first {
            setViewControllers([firstViewController],
                direction: .Forward,
                animated: true,
                completion: nil)
        }
        
        // Set title.
        let components = DateHelper.todayComponent()
        title = DateHelper.monthName(components)
        
        // Set today button.
        let b = UIBarButtonItem(title: "Today", style: .Plain, target: self, action: "goToday:")
        navigationItem.leftBarButtonItem = b
        
        // Add button.
        let b2 = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addTapped")
        navigationItem.rightBarButtonItem = b2

    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        viewControllers![0].viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    private func newMonthViewController(monthNum : Int ) -> UIViewController {
        let monthViewController = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewControllerWithIdentifier("monthViewController") as! MonthViewController
        
        let components = DateHelper.todayComponent()
        
        switch monthNum {
        case -1:
            monthViewController.monthComponents = DateHelper.lastMonth(components)
            break
        case 1:
            monthViewController.monthComponents = DateHelper.nextMonth(components)
            break
        default:
            monthViewController.monthComponents = components
        }
        
        return monthViewController
    }
    
    func goToday(sender: UIBarButtonItem) {
        let currentViewController = viewControllers![0] as! MonthViewController
        
        currentViewController.monthComponents = DateHelper.todayComponent()
        
        currentViewController.viewDidLoad()
        currentViewController.view.setNeedsDisplay()
        
        // Set title.
        let components = DateHelper.todayComponent()
        title = DateHelper.monthName(components)
        
        // Refresh other pages.
        pageViewController(self, viewControllerBeforeViewController: viewControllers![0])
        pageViewController(self, viewControllerAfterViewController: viewControllers![0])
    }
    
    func addTapped() {
        performSegueWithIdentifier("newEventSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers!.indexOf(viewController) else {
                return nil
            }
            
            var returnViewController : MonthViewController
            
            let previousIndex = viewControllerIndex - 1
            
            if previousIndex < 0 {
                returnViewController = orderedViewControllers![orderedViewControllers!.count - 1] as! MonthViewController
            } else {
                returnViewController = orderedViewControllers![previousIndex] as! MonthViewController
            }
            
            returnViewController.monthComponents = DateHelper.lastMonth((viewController as! MonthViewController).monthComponents!)
            
            returnViewController.viewDidLoad()
            
            return returnViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController,
        viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = orderedViewControllers!.indexOf(viewController) else {
                return nil
            }

            var returnViewController : MonthViewController

            let nextIndex = viewControllerIndex + 1
            let orderedViewControllersCount = orderedViewControllers!.count
            
            if orderedViewControllersCount <= nextIndex {
                returnViewController = orderedViewControllers![0] as! MonthViewController
            } else {
                returnViewController = orderedViewControllers![nextIndex] as! MonthViewController
            }
            
            returnViewController.monthComponents = DateHelper.nextMonth((viewController as! MonthViewController).monthComponents!)
           
            returnViewController.viewDidLoad()
            
            return returnViewController
    }
    
}

extension MainPageViewController : UIPageViewControllerDelegate {
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        let currentViewController = pageViewController.viewControllers![0] as! MonthViewController
        
        self.navigationItem.title = DateHelper.monthName(currentViewController.monthComponents!)
        
        viewControllers![0].viewDidLoad()
    }
}




