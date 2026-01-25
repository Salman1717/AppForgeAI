//
//  ClipboardManager.swift
//  AppForgeAI
//
//  Created by Salman Mhaskar on 25/01/26.
//

import UIKit

enum ClipboardManager{
    static func copy(_ text: String){
        UIPasteboard.general.string = text
    }
}
