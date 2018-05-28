//
//  LeftViewController.swift
//  LGSideMenuControllerDemo
//

//import FBSDKLoginKit
import UIKit

class LeftViewController: UITableViewController, UIAlertViewDelegate, Help {
    
    
    let emptyDic = ["name":"","image":"","viewController":""];
    let homeDic = ["name":"Home","image":"home.png","viewController":"CustomTabBarController"];
    let nearByDic = ["name":"Near Me","image":"nearme_icon.png","viewController":"CustomTabBarController"];
    let profileDic = ["name":"Profile","image":"help.png","viewController":"MultiProfileViewController"];
    let pointsDic = ["name":"Points","image":"addCard.png","viewController":"CustomTabBarController"];
    let resetDic = ["name":"Change Password","image":"resetPassword.png","viewController":"MultiProfileViewController"];
    let logoutDic = ["name":"Logout","image":"logout.png","viewController":"LoginViewController"];
    let loginDic = ["name":"Login","image":"logout.png","viewController":"LoginViewController"];
    
    let addPointsDic = ["name":"Add Points","image":"addPoints.png","viewController":"AddRedeemPointsViewController"];
    let redeemPointsDic = ["name":"Redeem Points","image":"redeemPoints.png","viewController":"AddRedeemPointsViewController"];

    var titlesArray: [[String:String]] = []
    var userDefaults:UserDefaults!
    
    //Service Calling
    var serviceRepository : ServiceRepository!
    let pch = PCH_File()
    
    init() {
        super.init(style: .plain)
        self.automaticallyAdjustsScrollViewInsets = false
        
        //Service Call
        serviceRepository = ServiceRepository()
        serviceRepository.delegate = self

        userDefaults = UserDefaults.standard
        
        let roleIDStr = userDefaults.value(forKey: "RoleId")
        if roleIDStr != nil
        {
            let roleId = NSString.init(format: "%@",roleIDStr as! CVarArg)
            if roleId.intValue == 2
            {
                titlesArray = [emptyDic,homeDic,addPointsDic,redeemPointsDic,logoutDic]
            }
            else if roleId.intValue == 3
            {
                titlesArray = [emptyDic,homeDic,nearByDic,profileDic,pointsDic,resetDic,logoutDic]
            }
        }
        else
        {
            titlesArray = [emptyDic,homeDic,nearByDic,profileDic,pointsDic,resetDic,loginDic]
        }
        
        view.backgroundColor = .clear

        tableView.register(LeftViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        //tableView.contentInset = UIEdgeInsets(top: 44.0, left: 0.0, bottom: 44.0, right: 0.0)
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        //tableView.backgroundColor = UIColor(colorLiteralRed: 233.0/255.0, green: 31.0/255.0, blue: 57.0/255.0, alpha: 1.0)
        
        
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
        return .fade
    }
    
    // MARK: - UITableViewDataSource

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titlesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeftViewCell
        
        //Rows Data
        let dic = titlesArray[indexPath.row]
        
        //cell.logoIcon.frame = CGRect(x: 30, y: 10, width: 40, height: 40)
        //cell.logoIcon.image = UIImage(named: dic["image"]!)
        
        cell.logoTitle.frame = CGRect(x: 30, y: 20, width: self.tableView.frame.size.width - 35, height: 20) //(80,20,self.tableView.frame.size.width - 85,20)
        cell.logoTitle.text = dic["name"]
        
        cell.isUserInteractionEnabled = (indexPath.row != 0)
        cell.separatorView.isHidden = (indexPath.row == 0)

        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexPath.row == 0) ? 20.0 : 60.0
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        //HeaderView
        let hearderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 80))
        hearderView.backgroundColor = UIColor.clear
        //let logoImgView = UIImageView(frame: CGRect(x: 10, y: 0, width: hearderView.frame.size.width-20, height: hearderView.frame.size.height))
        //logoImgView.image = UIImage(named: "logo.png")
        //hearderView.addSubview(logoImgView)
        return hearderView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 80
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
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
                    self.logOut()
                    //let mainViewController = self.sideMenuController!
                    //let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    //let navigationController = mainViewController.rootViewController as! NavigationController
                    //navigationController.pushViewController(storyBoard.instantiateViewController(withIdentifier: "LoginViewController"), animated: true)
                    //mainViewController.hideLeftView(animated: true, completionHandler: nil)
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
            
            let alertView: UIAlertView = UIAlertView(title: "Takeaway Genie ", message: message, delegate: self, cancelButtonTitle: title, otherButtonTitles: otherTitle)
            alertView.tag = tag
            alertView.show()
        }
    }
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int)
    {
        if alertView.tag == 2{
            if buttonIndex == 1 {
                
                self.logOut()
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
