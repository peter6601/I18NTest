//
//  ViewController.swift
//  I10NDemo
//
//  Created by 丁暐哲 on 2016/6/21.
//  Copyright © 2016年 Din. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var BMIlabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstTextField: UITextField!{
        didSet{
                firstTextField.delegate = self
        }
    }
    
    @IBOutlet weak var sencondTextfield: UITextField!{
        didSet{
            sencondTextfield.delegate = self
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    let currency = NSNumberFormatter()  //
    let weight = NSMassFormatter()
   
    let now = NSDate()
    let timeFormatter = NSDateFormatter()
    
    
    @IBAction func clickButton(sender: UIButton) {
        weight.unitStyle = .Long
        weightLabel.text = weight.stringFromKilograms(Double(firstTextField.text!)!)
          let height = String.localizedStringWithFormat("%.3f", Double(firstTextField.text!)!/(1.732*1.732))
        BMIlabel.text = height
        
        let currencyString = currency.stringFromNumber(Int(sencondTextfield.text!)!)
        
        currencyLabel.text =  currencyString
//        timeFormatter.setLocalizedDateFormatFromTemplate("yyyyMMddjjmmss")
//        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        timeFormatter.dateStyle = .ShortStyle
        timeFormatter.timeStyle = .ShortStyle
        let date = timeFormatter.stringFromDate(now)
        dateLabel.text = date
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        currency.numberStyle = NSNumberFormatterStyle.CurrencyISOCodeStyle
        
      
        
        let currencyString = currency.stringFromNumber(200)
        nameLabel.text = "DinDin"
        currencyLabel.text =  currencyString
        
    }

}

