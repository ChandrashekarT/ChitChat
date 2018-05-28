//
//  PCH File.swift
//  TakeawayGenie
//
//  Created by Epos Admin on 01/09/17.
//  Copyright © 2017 Epos Admin. All rights reserved.
//

import UIKit

class PCH_File: NSObject {
    
    var UrlPrefix:String!
    var UrlImagePrefix:String!
    override init()
    {
        super.init()
        
        UrlPrefix = "http://tg-dev.azurewebsites.net/Service"
        UrlImagePrefix = "http://tg-dev.azurewebsites.net"
        
        //UrlPrefix = "http://takeawaygenie.azurewebsites.net"
        //UrlImagePrefix = "http://takeawaygenie.azurewebsites.net/admin"
        
        //UrlPrefix = "http://localhost:10034"
        //UrlPrefix = "http://loyaltygenie-dev.azurewebsites.net"
    }

}
