//
//  My2ndControl.swift
//  KVO | KVC
//
//  Created by leslie on 7/12/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

///KVO System - B: (Optional) If we want every change to be reported
class My2ndControl: NSObject {
    //TODO: Optional 1- Reporting changes to the class
    @objc var round: Bool = false {
        didSet {
            self.didChangeValue(forKey: "round2")
        }
        willSet {
            self.willChangeValue(forKey: "round2")
        }
    }
}
