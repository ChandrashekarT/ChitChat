//
//  SettingsViewController.swift
//  ChitChat
//
//  Created by Epos Admin on 08/03/18.
//  Copyright © 2018 Epos Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Settings"
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
    
    
    @IBAction func homeButtonClicked()
    {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "CategoriesViewController"))!, animated: true)
    }
    @IBAction func profileButtonClicked()
    {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController"))!, animated: true)
    }
    @IBAction func logoutButtonClicked()
    {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController"))!, animated: true)
    }
    @IBAction func activityButtonClicked()
    {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "ActivityViewController"))!, animated: true)
    }
    @IBAction func myPostExpertiseButtonClicked()
    {
        self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "HistoryViewController"))!, animated: true)
    }

}
