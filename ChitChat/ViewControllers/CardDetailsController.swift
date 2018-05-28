//
//  CardDetailsController.swift
//  ChitChat
//
//  Created by Epos Admin on 12/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class CardDetailsController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var view9: UIView!
    
    @IBOutlet weak var cardTypeLbl: UILabel!
    
    var cardType:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationItem.hidesBackButton = true
        //Set Navigation Bar
        //Home
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        leftView.backgroundColor = UIColor.clear
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 5, width: 40, height: 40))
        leftImageView.image = UIImage.init(named: "home.png")
        let leftBtn = UIButton(frame: leftView.frame)
        leftBtn.backgroundColor = UIColor.clear
        leftBtn.addTarget(self, action: #selector(self.homeButtonAction), for: .touchUpInside)
        leftView.addSubview(leftImageView)
        leftView.addSubview(leftBtn)
        leftView.bringSubview(toFront: leftBtn)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        //Settings
        let rightView = UIView(frame: CGRect(x: self.view.frame.size.width - 100, y: 0, width: 100, height: 50))
        rightView.backgroundColor = UIColor.clear
        
        let settingsView = UIView(frame: CGRect(x: 50, y: 0, width: 50, height: 50))
        settingsView.backgroundColor = UIColor.clear
        let rightImageView = UIImageView(frame: CGRect(x: 5, y: 5, width: 40, height: 40))
        rightImageView.image = UIImage.init(named: "settings.png")
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightBtn.backgroundColor = UIColor.clear
        rightBtn.addTarget(self, action: #selector(self.settingsButtonAction), for: .touchUpInside)
        settingsView.addSubview(rightImageView)
        settingsView.addSubview(rightBtn)
        settingsView.bringSubview(toFront: leftBtn)
        rightView.addSubview(settingsView)
        
        let messageView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        messageView.backgroundColor = UIColor.clear
        let messageImageView = UIImageView(frame: CGRect(x: 7, y: 7, width: 36, height: 36))
        messageImageView.image = UIImage.init(named: "message.png")
        messageImageView.backgroundColor = UIColor.blue
        messageImageView.layer.cornerRadius = 18
        messageImageView.clipsToBounds = true
        let messageBtn = UIButton(frame: messageView.frame)
        messageBtn.backgroundColor = UIColor.clear
        messageBtn.addTarget(self, action: #selector(self.messageButtonAction), for: .touchUpInside)
        messageView.addSubview(messageImageView)
        messageView.addSubview(messageBtn)
        messageView.bringSubview(toFront: messageBtn)
        rightView.addSubview(messageView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightView)
        
        if cardType == "Credit"
        {
            cardTypeLbl.text = "Credit Card Info"
        }
        else
        {
            cardTypeLbl.text = "Debit Card Info"
        }
        
//        view1.layer.cornerRadius = 8.0
//        view1.layer.borderWidth = 1.0
//        view1.layer.borderColor = UIColor.black.cgColor
//        view2.layer.cornerRadius = 8.0
//        view2.layer.borderWidth = 1.0
//        view2.layer.borderColor = UIColor.black.cgColor
//        view3.layer.cornerRadius = 8.0
//        view3.layer.borderWidth = 1.0
//        view3.layer.borderColor = UIColor.black.cgColor
//        view4.layer.cornerRadius = 8.0
//        view4.layer.borderWidth = 1.0
//        view4.layer.borderColor = UIColor.black.cgColor
//        view5.layer.cornerRadius = 8.0
//        view5.layer.borderWidth = 1.0
//        view5.layer.borderColor = UIColor.black.cgColor
//        view6.layer.cornerRadius = 8.0
//        view6.layer.borderWidth = 1.0
//        view6.layer.borderColor = UIColor.black.cgColor
//        view7.layer.cornerRadius = 8.0
//        view7.layer.borderWidth = 1.0
//        view7.layer.borderColor = UIColor.black.cgColor
//        view8.layer.cornerRadius = 8.0
//        view8.layer.borderWidth = 1.0
//        view8.layer.borderColor = UIColor.black.cgColor
//        view9.layer.cornerRadius = 8.0
//        view9.layer.borderWidth = 1.0
//        view9.layer.borderColor = UIColor.black.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Navigation Bar Button Methods
    @objc func settingsButtonAction()
    {
        sideMenuController?.showRightView(animated: true, completionHandler: nil)
    }
    @objc func homeButtonAction()
    {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController")
        navigationController.viewControllers = [homeVC]
        mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
    }
    @objc func messageButtonAction()
    {
        
    }
    
    //MARK: -- IBActions
    @IBAction func postExpertiseAction(sender:Any)
    {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "PostExpertiseViewController")
        navigationController.viewControllers = [homeVC]
        mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
    }

}
