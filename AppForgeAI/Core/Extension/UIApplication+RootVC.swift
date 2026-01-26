//
//  UIApplication+RootVC.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import UIKit

extension UIApplication {
    
    var firstKeyWindow: UIWindow? {
        
        connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
}
