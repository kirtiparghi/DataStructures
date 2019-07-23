//
//  Utitlity.swift
//  DatastructuresSwift
//
//  Created by Kirti Parghi on 7/23/19.
//  Copyright © 2019 Kirti Parghi. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    
    public static func showAlertWith(title:String,message:String,viewController: UIViewController) {
        let alrtController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alrtController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alrtController, animated: true)
    }
}
