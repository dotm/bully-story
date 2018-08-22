//
//  Global.swift
//  bully-story
//
//  Created by Cifran on 18/08/18.
//  Copyright © 2018 Yoshua Elmaryono. All rights reserved.
//

import UIKit

var username: String = ""
var empathymeter: Int = 0

func saveGlobalData(){
    UserDefaults.standard.set(username, forKey: "username")
    UserDefaults.standard.set(empathymeter, forKey: "empathymeter")
}
func loadGlobalData(){
    username = UserDefaults.standard.string(forKey: "username")!
    empathymeter = UserDefaults.standard.integer(forKey: "empathymeter")
}
