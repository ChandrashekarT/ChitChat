//
//  DetailViewController.swift
//  ChitChat
//
//  Created by Epos Admin on 01/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Show Navigation Bar
        self.navigationController?.navigationBar.isHidden = false
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
        //Message
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
        //Title
        let titleLbl = UILabel(frame: CGRect(x: leftView.frame.size.width, y: 0, width: self.view.frame.size.width - (leftView.frame.size.width + rightView.frame.size.width), height: 30))
        titleLbl.textColor = UIColor.black
        titleLbl.text = "News"
        titleLbl.textAlignment = NSTextAlignment.center
        titleLbl.font = UIFont.boldSystemFont(ofSize: 20)
        self.navigationItem.titleView = titleLbl
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - IBActions
    @IBAction func postExpertiseAction(sender:Any)
    {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "PostExpertiseViewController")
        navigationController.viewControllers = [homeVC]
        mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
    }
    
    //MARK: -- UITableView Delegate & DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 20;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 40;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "DetailCatagoriCell"
        var cell : DetailCatagoriCell! = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DetailCatagoriCell
        if cell == nil {
            let nib = UINib.init(nibName: "DetailCatagoriCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
            cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! DetailCatagoriCell
            
        }
        cell.backgroundColor = UIColor.clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //let viewController = self.storyboard?.instantiateViewController(withIdentifier: "PostExpertiseViewController")
        //self.navigationController?.pushViewController(viewController!, animated: false)
    }

}
