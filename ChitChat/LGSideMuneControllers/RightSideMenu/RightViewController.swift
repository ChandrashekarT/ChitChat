//
//  RightViewController.swift
//  LGSideMenuControllerDemo
//
import UIKit

class RightViewController: UITableViewController, Help, UIAlertViewDelegate {
    
    let emptyDic = ["name":"","image":"","viewController":""]
    let homeDic = ["name":"Home","image":"home.png","viewController":"CategoriesViewController"];
    let profileDic = ["name":"Profile","image":"help.png","viewController":"ProfileViewController"];
    let activityDic = ["name":"Activity","image":"addCard.png","viewController":"ActivityViewController"];
    let historyDic = ["name":"History","image":"addCard.png","viewController":"HistoryViewController"];
    let bankDic = ["name":"Bank Info","image":"resetPassword.png","viewController":"BankDetailsController"];
    let cardDic = ["name":"Card Info","image":"resetPassword.png","viewController":"CallDetailsViewController"];
    let logoutDic = ["name":"Logout","image":"logout.png","viewController":"LoginViewController"];

    var titlesArray: [[String:String]] = []
    var userDefaults:UserDefaults!
    
    //Service Calling
    var serviceRepository : ServiceRepository!
    let pch = PCH_File()
    
    init() {
        super.init(style: .plain)
        
        //Service Call
        serviceRepository = ServiceRepository()
        serviceRepository.delegate = self
        
        userDefaults = UserDefaults.standard

        view.backgroundColor = .clear
        tableView.register(RightViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        
        titlesArray = [emptyDic,homeDic,profileDic,activityDic,historyDic,bankDic,cardDic,logoutDic]
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }

    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RightViewCell

        //Rows Data
        let dic = titlesArray[indexPath.row]
        cell.logoTitle.frame = CGRect(x: 20, y: 20, width: self.tableView.frame.size.width - 25, height: 20)
        cell.logoTitle.text = dic["name"]
        
        cell.isUserInteractionEnabled = (indexPath.row != 0)
        cell.separatorView.isHidden = (indexPath.row == 0)
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 0) ? 20.0 : 60.0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        //HeaderView
        let hearderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 80))
        hearderView.backgroundColor = UIColor.clear
        return hearderView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainViewController = sideMenuController!
        let navigationController = mainViewController.rootViewController as! NavigationController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 1 {
            let homeVC = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController")
            navigationController.viewControllers = [homeVC]
            mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
        }
        else if indexPath.row == 2 {
            for vc: UIViewController in navigationController.viewControllers {
                if (vc.isKind(of:ProfileViewController.self)) {
                    navigationController.viewControllers = [vc]
                    mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
                    return
                }
            }
            navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "ProfileViewController"), animated: true)
            mainViewController.hideRightView(animated: true, completionHandler: nil)
            
        }
        else if indexPath.row == 3 {
            for vc: UIViewController in navigationController.viewControllers {
                if (vc.isKind(of:ActivityViewController.self)) {
                    navigationController.viewControllers = [vc]
                    mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
                    return
                }
            }
            navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "ActivityViewController"), animated: true)
            mainViewController.hideRightView(animated: true, completionHandler: nil)
            
        }
        else if indexPath.row == 4 {
            for vc: UIViewController in navigationController.viewControllers {
                if (vc.isKind(of:ActivityViewController.self)) {
                    navigationController.viewControllers = [vc]
                    mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
                    return
                }
            }
            navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "HistoryViewController"), animated: true)
            mainViewController.hideRightView(animated: true, completionHandler: nil)
            
        }
        else if indexPath.row == 5 {
            
            for vc: UIViewController in navigationController.viewControllers {
                if (vc.isKind(of:BankDetailsController.self)) {
                    navigationController.viewControllers = [vc]
                    mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
                    return
                }
            }
            navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "BankDetailsController"), animated: true)
            mainViewController.hideRightView(animated: true, completionHandler: nil)
        }
        else if indexPath.row == 6 {
            for vc: UIViewController in navigationController.viewControllers {
                if (vc.isKind(of:CardDetailsController.self)) {
                    navigationController.viewControllers = [vc]
                    mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
                    return
                }
            }
            navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "CardDetailsController"), animated: true)
            mainViewController.hideRightView(animated: true, completionHandler: nil)
        }
        else if indexPath.row == titlesArray.count-1
        {
            mainViewController.hideRightView(animated: true, delay: 0.0, completionHandler: nil)
            self.showAleart(message: "Are you confirm to logout", tag: 2)
        }
            
        else {
            let viewController = UIViewController()
            viewController.view.backgroundColor = .white
            viewController.title = "Test \(titlesArray[indexPath.row])"
            
            let navigationController = mainViewController.rootViewController as! NavigationController
            navigationController.pushViewController(viewController, animated: true)
            
            mainViewController.hideRightView(animated: true, completionHandler: nil)
        }
        
    }
    
    //Mark: Alearts Methods
    func showAleart(message:String, tag:Int) {
        //if #available(iOS 7.0, *) {} else {}
        let systemVersion = UIDevice.current.systemVersion
        let currentVersion:Float = NSString(string: systemVersion).floatValue
        if currentVersion >= 9.0 {
            let alert = UIAlertController(title: "Takeaway Genie", message: message, preferredStyle: UIAlertControllerStyle.alert)
            
            var title = "Ok"
            if tag != 1
            {
                title = "Cancel"
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
                    
                    //Chandu
                    //self.logOut()
                    
                    
                    let mainViewController = self.sideMenuController!
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let navigationController = mainViewController.rootViewController as! NavigationController
                    navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "LoginViewController"), animated: true)
                    mainViewController.hideLeftView(animated: true, completionHandler: nil)
                }))
            }
            alert.addAction(UIAlertAction(title: title , style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
                //var message:String = (alert.message?.lowercased())!
                //message = message.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                //let message2 = message.trimmingCharacters(in: NSCharacterSet.whitespaces)
                //if message2 == "an error has occurred."
                //{
                //    print("Logout")
                //    self.gotoLogoutSreen()
                //}
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            var title:String!
            var otherTitle:String!
            if tag == 1
            {
                otherTitle = "Ok"
            }
            else
            {
                title = "Cancel"
                otherTitle = "Ok"
            }
            
            let alertView: UIAlertView = UIAlertView(title: "ChitChat", message: message, delegate: self, cancelButtonTitle: title, otherButtonTitles: otherTitle)
            alertView.tag = tag
            alertView.show()
        }
    }
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int)
    {
        if alertView.tag == 2{
            if buttonIndex == 1 {
                
                //self.logOut()
            }
        }
        
    }
    
    
    //Mark: Logout Method
    func logOut() {
        
        userDefaults = UserDefaults.standard
        let bodyDic = ["UserId": userDefaults.object(forKey: "UserId"),
                       "Token": userDefaults.object(forKey: "Token")]
        print(bodyDic)
        
        let urlStr = String(format: "%@/api/Account/LogOut",pch.UrlPrefix)
        serviceRepository.post(serverUrl: urlStr, body: bodyDic as [String : AnyObject], serviceType: "LogOut")
    }
    
    func gotoLogoutSreen() {
        
        //Add RoleId
        userDefaults.removeObject(forKey: "UserInfo")
        userDefaults.removeObject(forKey: "RoleId")
        
        userDefaults.removeObject(forKey: "isLogin")
        userDefaults.set("false", forKey: "isLogin")
        userDefaults.synchronize()
        
        
        //        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        //
        //        let storyBoard: UIStoryboard? = UIStoryboard(name: "Main", bundle: nil)
        //        let navigationController = NavigationController(rootViewController:(storyBoard?.instantiateViewController(withIdentifier: "LoginViewController"))!)
        //        let mainViewController = MainViewController()
        //        mainViewController.rootViewController = navigationController
        //        mainViewController.setup(type: UInt(2))
        //        appDelegate.window?.rootViewController = mainViewController
        //        UIView.transition(with: appDelegate.window!, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }
    
    
    //MARK : -- Parsing Delegate Methods
    func successResponse(response:AnyObject, serviceType:String)
    {
        print("Success");
        
        if serviceType == "LogOut"
        {
            if response is [String:AnyObject]{
                
                let result = response.allKeys.contains { (key) -> Bool in
                    key as? String == "Status"
                }
                
                if result == true {
                    if  response["Status"] as! Bool == true
                    {
                        DispatchQueue.main.async {
                            self.gotoLogoutSreen()
                        }
                    }
                    else
                    {
                        print(response["Message"])
                        self.showAleart(message: response["Message"] as! String, tag: 1)
                    }
                }
                else{
                    print(response["Message"])
                    self.showAleart(message: response["Message"] as! String, tag: 1)
                }
                
            }
        }
    }
    func failedResponse(response:AnyObject, serviceType:String)
    {
        //activityView.completeLoading(success: false)
        self.showAleart(message: "Unable to connect server", tag: 1)
        print("Fail");
        
    }

}
