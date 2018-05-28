//
//  LoginViewController.swift
//  ChitChat
//
//  Created by Epos Admin on 15/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var nameContentView : UIView!
    @IBOutlet weak var phoneContentView : UIView!
    @IBOutlet weak var nameTextField : UITextField!
    @IBOutlet weak var phoneTextField : UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide Navigation Bar
        self.navigationController?.navigationBar.isHidden = true
        
        //nameContentView.layer.cornerRadius = 8.0
        //nameContentView.layer.borderWidth = 1.0
        //nameContentView.layer.borderColor = UIColor.black.cgColor
        
        //phoneContentView.layer.cornerRadius = 8.0
        //phoneContentView.layer.borderWidth = 1.0
        //phoneContentView.layer.borderColor = UIColor.black.cgColor
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

    @IBAction func gotoCategories()
    {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController")
        self.navigationController?.pushViewController(viewController!, animated: false)
    }
    
    //MARK: --UITextField Delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField.returnKeyType == .next {
            self.phoneTextField.becomeFirstResponder()
        }
        else if textField.returnKeyType == .join
        {
            print("Go to Home screen")
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController") //DetailViewController  //CategoriesViewController
            self.navigationController?.pushViewController(viewController!, animated: false)
        }
        return true
    }
    
}
