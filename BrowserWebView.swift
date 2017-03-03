//
//  BrowserWebView.swift
//  Facts
//
//  Created by Soya Diaoune on 2/18/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit

class BrowserWebView: UIWebView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
//        if action == #selector(copy(_:)) {
//            return false
//        }
//        if action == #selector(paste(_:)) {
//            return false
//        }
//        if action == #selector(select(_:)) {
//            return false
//        }
//        if action == #selector(selectAll(_:)) {
//            return false
//        }
        
        if action != #selector(BrowserViewController.newAnnotationPressed) {
            return false
        }

        return super.canPerformAction(action, withSender: sender)
    }

}
