//
//  RegistrationViewController.swift
//  ChitChat
//
//  Created by Epos Admin on 01/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
