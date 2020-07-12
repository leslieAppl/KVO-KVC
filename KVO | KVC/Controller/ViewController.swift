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
    var lableColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lableColor = counterLbl.textColor
        
        control = MyControl()
        
        //TODO: 3- Add/register observers using KVO - addObserver() method
        control.addObserver(self, forKeyPath: "round", options: [], context: nil)
    }

    //TODO: 2- Modifying property values using KVC - setValue() method
    @IBAction func updateValue(_ sender: UIStepper) {
        let current = Int(sender.value)
        if current % 10 == 0 {
            control.setValue(true, forKey: "round")
        } else {
            control.setValue(false, forKey: "round")
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
    }
}
