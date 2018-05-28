//
//  PostExpertiseViewController.swift
//  ChitChat
//
//  Created by Epos Admin on 20/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class PostExpertiseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contentView:UIView!
    @IBOutlet weak var categoryContentView:UIView!
    @IBOutlet weak var categoryTextField:UITextField!
    @IBOutlet weak var rateTypeContentView:UIView!
    @IBOutlet weak var rateTypeTextField:UITextField!
    @IBOutlet weak var timeAvailbilityContentView:UIView!
    @IBOutlet weak var timeAvailbilityTextField:UITextField!
    @IBOutlet weak var timeFromContentView:UIView!
    @IBOutlet weak var timeFromTextField:UITextField!
    @IBOutlet weak var timeToContentView:UIView!
    @IBOutlet weak var timeToTextField:UITextField!
    @IBOutlet weak var rateTextField:UITextField!
    @IBOutlet weak var topicNameTextField:UITextField!
    @IBOutlet weak var callDurationTextField:UITextField!

    var categoryTV : UITableView!
    var rateTV : UITableView!
    var timeTV : UITableView!
    var timeFromTV : UITableView!
    var timeToTV : UITableView!
    
    var categoryArr : [AnyObject] = []
    var rateArr : [AnyObject] = []
    var timeArr : [AnyObject] = []
    var timeFromArr : [AnyObject] = []
    var timeToArr : [AnyObject] = []
    
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
        
        //Title
        let titleLbl = UILabel(frame: CGRect(x: leftView.frame.size.width, y: 0, width: self.view.frame.size.width - (leftView.frame.size.width + rightView.frame.size.width), height: 30))
        titleLbl.textColor = UIColor.black
        titleLbl.text = ""
        titleLbl.textAlignment = NSTextAlignment.center
        titleLbl.font = UIFont.boldSystemFont(ofSize: 20)
        self.navigationItem.titleView = titleLbl
        
        categoryArr = ["News", "Movies", "Songs", "Education"] as [AnyObject]
        timeArr = ["Morning Availability", "Afternoon Availability", "Evening Availability"] as [AnyObject]
        rateArr = ["Per 1hr", "Per 2hr", "Per half day"] as [AnyObject]
        
        //Add Tables to View
        categoryTV = UITableView()
        categoryTV.frame = CGRect(x: categoryContentView.frame.origin.x, y: (categoryContentView.frame.origin.y+categoryContentView.frame.size.height), width: categoryContentView.frame.size.width, height: 100)
        categoryTV.backgroundColor = UIColor.white
        categoryTV.layer.borderWidth = 1.0
        categoryTV.layer.borderColor = UIColor.black.cgColor
        categoryTV.delegate = self
        categoryTV.dataSource = self
        contentView.addSubview(categoryTV)
        categoryTV.isHidden = true
        
        timeTV = UITableView()
        timeTV.frame = CGRect(x: timeAvailbilityContentView.frame.origin.x, y: (timeAvailbilityContentView.frame.origin.y+timeAvailbilityContentView.frame.size.height), width: timeAvailbilityContentView.frame.size.width, height: 100)
        timeTV.backgroundColor = UIColor.white
        timeTV.layer.borderWidth = 1.0
        timeTV.layer.borderColor = UIColor.black.cgColor
        timeTV.delegate = self
        timeTV.dataSource = self
        contentView.addSubview(timeTV)
        timeTV.isHidden = true
        
        rateTV = UITableView()
        rateTV.frame = CGRect(x: rateTypeContentView.frame.origin.x, y: (rateTypeContentView.frame.origin.y+rateTypeContentView.frame.size.height), width: rateTypeContentView.frame.size.width, height: 100)
        rateTV.backgroundColor = UIColor.white
        rateTV.layer.borderWidth = 1.0
        rateTV.layer.borderColor = UIColor.black.cgColor
        rateTV.delegate = self
        rateTV.dataSource = self
        contentView.addSubview(rateTV)
        rateTV.isHidden = true
        
        timeFromTV = UITableView()
        timeFromTV.frame = CGRect(x: timeFromContentView.frame.origin.x, y: (timeFromContentView.frame.origin.y+timeFromContentView.frame.size.height), width: timeFromContentView.frame.size.width, height: 100)
        timeFromTV.backgroundColor = UIColor.white
        timeFromTV.layer.borderWidth = 1.0
        timeFromTV.layer.borderColor = UIColor.black.cgColor
        timeFromTV.delegate = self
        timeFromTV.dataSource = self
        contentView.addSubview(timeFromTV)
        timeFromTV.isHidden = true
        
        timeToTV = UITableView()
        timeToTV.frame = CGRect(x: timeToContentView.frame.origin.x, y: (timeToContentView.frame.origin.y+timeToContentView.frame.size.height), width: timeToContentView.frame.size.width, height: 100)
        timeToTV.backgroundColor = UIColor.white
        timeToTV.layer.borderWidth = 1.0
        timeToTV.layer.borderColor = UIColor.black.cgColor
        timeToTV.delegate = self
        timeToTV.dataSource = self
        contentView.addSubview(timeToTV)
        timeToTV.isHidden = true
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
    @IBAction func submitAction(_ sender: Any) {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController")
        navigationController.viewControllers = [homeVC]
        mainViewController.hideLeftView(animated: true, delay: 0.0, completionHandler: nil)
        
//        let alertAction = UIAlertController.init(title: "", message: "Please selct any one payment option", preferredStyle: .actionSheet)
//        let bankInfoAction = UIAlertAction(title: "Bank Payment", style: .default) { (alertAction) in
//            self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "BankDetailsController"))!, animated: true)
//        }
//        let creditCardAction = UIAlertAction(title: "Credit Card Payment", style: .default) { (alertAction) in
//            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//            let cardVC = storyBoard.instantiateViewController(withIdentifier: "CardDetailsController") as! CardDetailsController
//            cardVC.cardType = "Credit"
//            self.navigationController?.pushViewController(cardVC, animated: true)
//        }
//        let debitCardAction = UIAlertAction(title: "Debit Card Payment", style: .default) { (alertAction) in
//            let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
//            let cardVC = storyBoard.instantiateViewController(withIdentifier: "CardDetailsController") as! CardDetailsController
//            cardVC.cardType = "Debit"
//            self.navigationController?.pushViewController(cardVC, animated: true)
//        }
//        alertAction.addAction(bankInfoAction)
//        alertAction.addAction(creditCardAction)
//        alertAction.addAction(debitCardAction)
//        self.present(alertAction, animated: true, completion: nil)
    }
    
    @IBAction func selectCategoryAction(_ sender: Any) {
        categoryTV.isHidden = false
    }
    @IBAction func selectRateTypeAction(_ sender: Any) {
        rateTV.isHidden = false
    }
    @IBAction func selectTimeAvailbilityAction(_ sender: Any) {
        timeTV.isHidden = false
    }
    @IBAction func selectTimeFromAction(_ sender: Any) {
        timeFromTV.isHidden = false
    }
    @IBAction func selectTimeToAction(_ sender: Any) {
        timeToTV.isHidden = false
    }
    
    
    //MARK: -- UITableView Delegate & DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView == categoryTV
        {
            return categoryArr.count
        }
        else if tableView == rateTV
        {
            return rateArr.count
        }
        else if tableView == timeTV
        {
            return timeArr.count
        }
        else if tableView == timeFromTV
        {
            return timeFromArr.count
        }
        else if tableView == timeToTV
        {
            return timeToArr.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 30;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellIdentifier = "Cell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
        cell?.backgroundColor = UIColor.clear
        cell?.selectionStyle = .none
        cell?.textLabel?.textAlignment = .center
        
        if tableView == categoryTV
        {
            cell?.textLabel?.text = String.init(format: "%@", categoryArr[indexPath.row] as! CVarArg)
        }
        else if tableView == rateTV
        {
            cell?.textLabel?.text = String.init(format: "%@", rateArr[indexPath.row] as! CVarArg)
        }
        else if tableView == timeTV
        {
            cell?.textLabel?.text = String.init(format: "%@", timeArr[indexPath.row] as! CVarArg)
        }
        else if tableView == timeFromTV
        {
            cell?.textLabel?.text = String.init(format: "%@", timeFromArr[indexPath.row] as! CVarArg)
        }
        else if tableView == timeToTV
        {
            cell?.textLabel?.text = String.init(format: "%@", timeToArr[indexPath.row] as! CVarArg)
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if tableView == categoryTV
        {
            categoryTextField.text = String.init(format: "%@", categoryArr[indexPath.row] as! CVarArg)
            categoryTV.isHidden = true
        }
        else if tableView == rateTV
        {
            rateTypeTextField.text = String.init(format: "%@", rateArr[indexPath.row] as! CVarArg)
            rateTV.isHidden = true
        }
        else if tableView == timeTV
        {
            
            timeAvailbilityTextField.text = String.init(format: "%@", timeArr[indexPath.row] as! CVarArg)
            if timeAvailbilityTextField.text == "Morning Availability"
            {
                timeFromArr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"] as [AnyObject]
                timeFromTV.reloadData()
                timeToArr = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"] as [AnyObject]
                timeToTV.reloadData()
            }
            else if timeAvailbilityTextField.text == "Afternoon Availability"
            {
                timeFromArr = ["1", "2", "3"] as [AnyObject]
                timeFromTV.reloadData()
                timeToArr = ["2", "3", "4"] as [AnyObject]
                timeToTV.reloadData()
            }
            else if timeAvailbilityTextField.text == "Evening Availability"
            {
                timeFromArr = ["4", "5", "6", "7", "8", "9", "10", "11"] as [AnyObject]
                timeFromTV.reloadData()
                timeToArr = ["5", "6", "7", "8", "9", "10", "11", "12"] as [AnyObject]
                timeToTV.reloadData()
            }
            timeTV.isHidden = true
        }
        else if tableView == timeFromTV
        {
            timeFromTextField.text = String.init(format: "%@", timeFromArr[indexPath.row] as! CVarArg)
            timeFromTV.isHidden = true
        }
        else if tableView == timeToTV
        {
            timeToTextField.text = String.init(format: "%@", timeToArr[indexPath.row] as! CVarArg)
            timeToTV.isHidden = true
        }
    }

}
