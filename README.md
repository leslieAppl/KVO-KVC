# KVO and KVC System

## KVO System - A: KVC (Key/Value Coding)

### -1 Conform to the NSKeyValueCoding protocol

### -2 Modifying property values using KVC - setValue() method

### -3 Adding/Registering observers using KVO - addObserver() method

### -4 Observing values changed using KVO - observeValue() method

## KVO System - B: (Optional) If we want every change to be reported
        
        class MyControl: NSObject {
           @objc var round = false {
              didSet {
                 self.didChangeValue(forKey: "round")
              }
              willSet {
                 self.willChangeValue(forKey: "round")
              }
           }
        }

        @IBAction func updateValue(_ sender: UIStepper) {
           let current = Int(sender.value)
           if current % 10 == 0 {
              control.round = true
           } else {
              control.round = false
           }
           counterLabel.text = String(current)
        }

