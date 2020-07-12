//
//  ViewController.swift
//  KVO | KVC
//
//  Created by leslie on 7/11/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLbl: UILabel!
    
    var control: MyControl!
    var control2: My2ndControl!
    var lableColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lableColor = counterLbl.textColor
        
        control = MyControl()
        control2 = My2ndControl()
        
        //TODO: 3- Add/register observers using KVO - addObserver() method
        control.addObserver(self, forKeyPath: "round", options: [], context: nil)
        
        //TODO: Optional 3- Working with a KVO compliant property
        ///KVO System - B: (Optional) If we want every change to be reported (don't need 'keyPath" like before)
        control2.addObserver(self, forKeyPath: "round2", options: [], context: nil)
    }

    @IBAction func updateValue(_ sender: UIStepper) {
        let current = Int(sender.value)

        //TODO: 2- Modifying property values using KVC - setValue() method
        if current % 10 == 0 {
            control.setValue(true, forKey: "round")
        } else {
            control.setValue(false, forKey: "round")
        }
        
        //TODO: Optional 2- Working with a KVO compliant property
        ///KVO System - B: (Optional) If we want every change to be reported (don't need 'keyPath" like before)
        if current % 3 == 0 {
            control2.round = true
        } else {
            control2.round = false
        }
        
        counterLbl.text = String(current)
    }
        
}

//MARK: - NSKeyValueObserving protocol by Default
extension ViewController {
    
    //TODO: 4- Observing values changed using observeValue() method
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "round" {
            if control.round {
                counterLbl.textColor = .red
            } else {
                counterLbl.textColor = lableColor
            }
        }
        //TODO: Optional 4- Working with a KVO compliant property
        ///KVO System - B: (Optional) If we want every change to be reported (don't need 'keyPath" like before)
        else if keyPath == "round2" {
            if control2.round {
                counterLbl.textColor = .green
            } 
        }
    }
}
