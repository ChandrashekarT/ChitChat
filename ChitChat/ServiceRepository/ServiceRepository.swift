//
//  ServiceRepository.swift
//  SampleAlamofire
//
//  Created by Epos Admin on 02/08/17.
//  Copyright © 2017 Epos Admin. All rights reserved.
//

import UIKit
import Alamofire

protocol Help {
    
    func successResponse(response:AnyObject, serviceType:String)
    func failedResponse(response:AnyObject, serviceType:String)
    
}

class ServiceRepository: NSObject {

    //var delegate : Help = AnyObject.self as! Help
    var delegate: Help? //= self as! Help
    var appDelegate:AppDelegate!
    
    var activityView: activityIndicator!
    var activityContentView : UIView!
    
    override init() {
        super.init()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.activityIndicatorView()
    }
    
    //MARK: -- Activity Indicator Methods
    //ActivityIndicator
    
    func activityIndicatorView() {
        
        if activityContentView == nil
        {
            activityView = activityIndicator()
            activityView.strokeColor = UIColor.red
            activityView.lineWidth = 3.0
            activityView.frame = CGRect(x: 15, y: 15, width: 70, height: 70)
            
            let bounds = UIScreen.main.bounds
            let width = bounds.size.width
            let height = bounds.size.height
            
            let centerView = UIView()
            centerView.frame = CGRect(x: width/2 - 50, y: height/2 - 50, width: 100, height: 100)
            centerView.backgroundColor = UIColor.lightText
            centerView.layer.cornerRadius = 10
            centerView.clipsToBounds = true
            centerView.addSubview(activityView)
            centerView.bringSubview(toFront: activityView)
            
            activityContentView = UIView()
            activityContentView.frame = bounds
            //activityContentView.backgroundColor = UIColor.init(patternImage: UIImage.init(named: "tr1.jpg")!)
            activityContentView.backgroundColor = UIColor.clear
            activityContentView.addSubview(centerView)
            let window = UIApplication.shared.keyWindow
            let mainViewController = window?.rootViewController
            mainViewController?.view.addSubview(activityContentView)
            mainViewController?.view.bringSubview(toFront: activityContentView)
            //UIApplication.shared.keyWindow?.rootViewController?.view.addSubview(activityContentView)
            
            activityContentView.isHidden = true
        }
    }
    
    func showActivityIndicator(){
        //self.activityIndicatorView()
        activityContentView.isHidden = false
        activityView.startLoading()
    }
    func hiddenActivityIndicator(){
        //activityView.completeLoading(success: true)
        activityView.status = .Completion
        activityContentView.isHidden = true
        //activityContentView.removeFromSuperview()
    }
    
    
    func post(serverUrl:String, body:[String:AnyObject], serviceType:String) {
        if appDelegate.interNetConnectivity() == false
        {
            self.showAleart(message: "Please check your internet connection.")
            return
        }
        self.showActivityIndicator()
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            Alamofire.request(serverUrl, method:.post, parameters: body, encoding: URLEncoding.default)
                .responseJSON { response in
                    self.hiddenActivityIndicator()
                    switch response.result {
                    case .success(let responseObject):
                        print("example success \(responseObject)")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.successResponse(response: responseObject as AnyObject, serviceType: serviceType)
                        }
                    case .failure (let error):
                        print("error with response status: \(error) ")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.failedResponse(response:error.localizedDescription as AnyObject, serviceType:serviceType)
                        }
                    }
            }
        }
        
        
    }
    
    func post(serverUrl:String, serviceType:String) {
        if appDelegate.interNetConnectivity() == false
        {
            self.showAleart(message: "Please check your internet connection.")
            return
        }
        self.showActivityIndicator()
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            Alamofire.request(serverUrl, method:.post, parameters: nil, encoding: URLEncoding.default)
                .responseJSON { response in
                    self.hiddenActivityIndicator()
                    switch response.result {
                    case .success(let responseObject):
                        print("example success \(responseObject)")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.successResponse(response: responseObject as AnyObject, serviceType: serviceType)
                        }
                    case .failure (let error):
                        print("error with response status: \(error) ")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.failedResponse(response:error.localizedDescription as AnyObject, serviceType:serviceType)
                        }
                    }
            }
        }
        
    }
    
    func get(serverUrl:String, body:[String:AnyObject], serviceType:String) {
        if appDelegate.interNetConnectivity() == false
        {
            self.showAleart(message: "Please check your internet connection.")
            return
        }
        self.showActivityIndicator()
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            Alamofire.request(serverUrl, method:.get, parameters: body, encoding: URLEncoding.default)
                .responseJSON { response in
                    self.hiddenActivityIndicator()
                    switch response.result {
                    case .success(let responseObject):
                        print("example success \(responseObject)")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.successResponse(response: responseObject as AnyObject, serviceType: serviceType)
                        }
                    case .failure (let error):
                        print("error with response status: \(error) ")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.failedResponse(response:error.localizedDescription as AnyObject, serviceType:serviceType)
                        }
                    }
            }
        }
    }
    
    func get(serverUrl:String, serviceType:String) {
        if appDelegate.interNetConnectivity() == false
        {
            self.showAleart(message: "Please check your internet connection.")
            return
        }
        self.showActivityIndicator()
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            Alamofire.request(serverUrl, method:.get, parameters: nil, encoding: URLEncoding.default)
                .responseJSON { response in
                    
                    switch response.result {
                    case .success(let responseObject):
                        print("example success \(responseObject)")
                        
                        /*
                         //Convert Response to Json string
                         do {
                         let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String:Any]
                         print(json)
                         self.delegate?.successResponse(response: json as AnyObject, serviceType: serviceType)
                         } catch let error as NSError {
                         print(error)
                         }
                         */
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.successResponse(response: responseObject as AnyObject, serviceType: serviceType)
                        }
                        
                    case .failure (let error):
                        print("error with response status: \(error) ")
                        DispatchQueue.main.async {
                            self.hiddenActivityIndicator()
                            self.delegate?.failedResponse(response:error.localizedDescription as AnyObject, serviceType:serviceType)
                        }
                    }
            }
            
            
        }
                
        
    }
    
    //MARK: -- Alert View Methods
    func showAleart(message:String) {
        let systemVersion = UIDevice.current.systemVersion
        let currentVersion:Float = NSString(string: systemVersion).floatValue
        if currentVersion >= 9.0 {
            let alert = UIAlertController(title: "Takeaway Genie", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            
            let window = UIApplication.shared.keyWindow
            let viewController = window?.rootViewController!
            viewController?.present(alert, animated: true, completion: nil)
        } else {
            let alertView: UIAlertView = UIAlertView(title: "Takeaway Genie ", message: message, delegate: nil, cancelButtonTitle: nil, otherButtonTitles: "Ok")
            alertView.show()
        }
        
    }

}
