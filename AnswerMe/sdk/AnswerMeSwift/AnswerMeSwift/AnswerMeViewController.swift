//
//  ViewController.swift
//  AnswerMeSwift
//
//  Created by Tom Wojciechowski on 28/09/2017.
//  Copyright © 2017 mobivm. All rights reserved.
//

import UIKit
import ObjectiveC

@objc
class AMCounterImpl : NSObject {
    
}

class AnswerMeViewController: UIViewController {
    
    var sdk: AMAnswerMeSDK!;
    var counter: AMCounter!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sdk = AMAnswerMeSDK.instance();
        
        counter = sdk.obtainAMCounter();
        
        currentCountLabel.text = "Current Count";
        currentCount.text = "0";
        
        
        //Issues, canot cast from the implemtation to the 'abstract class'
        //let counterClazz = NSClassFromString("AMCounterImpl") as! AMCounter.Type;
        //let counterObject = counterClazz.init();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   func updateLabel() {
        let value = counter.value;
        currentCount.text = String(value);
    }


    @IBOutlet weak var currentCount: UILabel!
    @IBOutlet weak var currentCountLabel: UILabel!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBAction func minusPressed(_ sender: Any) {
        counter.minusValue(1);
        updateLabel();
    }
    @IBOutlet weak var addButton: UIButton!
    @IBAction func addPressed(_ sender: Any) {
        counter.addValue(1);
        updateLabel();
    }
}

