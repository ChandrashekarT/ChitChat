//
//  BankDetailsController.swift
//  ChitChat
//
//  Created by Epos Admin on 09/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class BankDetailsController: UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var bankContentView : UIView!
    @IBOutlet weak var bankNameLbl : UILabel!
    var isBankSelected:Bool = false
    var bankListTV:UITableView!
    
    let bankListArr = ["Andhra Bank", "Axis Bank", "ICICI Bank", "IDBI Bank", "SBI Bank","APGVB Bank"]

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
        
//        //Bank List TableView
//        bankListTV = UITableView(frame: CGRect(x: bankContentView.frame.origin.x, y: (bankContentView.frame.origin.y + bankContentView.frame.size.height+64), width: bankContentView.frame.size.width, height: 180))
//        bankListTV.delegate = self
//        bankListTV.dataSource = self
//        bankListTV.layer.borderWidth = 1.0
//        bankListTV.layer.borderColor = UIColor.black.cgColor
//        self.view.addSubview(bankListTV)
//        self.view.bringSubview(toFront: bankListTV)
//        bankListTV.isHidden = true
        
//        view1.layer.cornerRadius = 8.0
//        view1.layer.borderWidth = 1.0
//        view1.layer.borderColor = UIColor.black.cgColor
//        view2.layer.cornerRadius = 8.0
//        view2.layer.borderWidth = 1.0
//        view2.layer.borderColor = UIColor.black.cgColor
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
    @IBAction func bankListAction(_ sender: Any) {
        if isBankSelected
        {
            isBankSelected = false
            bankListTV.isHidden = true
        }
        else
        {
            isBankSelected = true
            bankListTV.isHidden = false
        }
        //self.cuisineServiceCall()
    }
    
    //MARK: -- UITableView Delegate & DataSource Methods
    func reloadCuisineTableData() {
    }
    
    func reloadRestaurantTableData() {
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bankListArr.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 35
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier:String = "cell"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier) as UITableViewCell!
        }
        
        let bankName = bankListArr[indexPath.row]
        cell?.textLabel?.text = bankName
        cell?.textLabel?.textAlignment = NSTextAlignment.center
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        bankListTV.isHidden = true
        bankNameLbl.text = bankListArr[indexPath.row]
    }

}
