//
//  CreateNewRideViewController.swift
//  Carpooling
//
//  Created by Sanjay Shrestha on 4/10/16.
//  Copyright © 2016 St Marys. All rights reserved.
//

import UIKit

class CreateNewRideViewController: UIViewController {

    
    @IBOutlet weak var notes: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var fromStreetAddressTextField: UITextField!
    @IBOutlet weak var fromCityTextField: UITextField!
    @IBOutlet weak var fromStateTextField: UITextField!
    @IBOutlet weak var fromZipCode: UITextField!
    
    @IBOutlet weak var toStreetAddressTextField: UITextField!
    @IBOutlet weak var toCityTextfield: UITextField!
    @IBOutlet weak var toStateTextField: UITextField!
    @IBOutlet weak var toZipCodeTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.hidden = true
        doneButton.hidden = true
        confirmTextFieldDelegate()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func confirmTextFieldDelegate() {
        fromStreetAddressTextField.delegate = self
        fromCityTextField.delegate = self
        fromStateTextField.delegate = self
        fromZipCode.delegate = self
        toStreetAddressTextField.delegate = self
        toCityTextfield.delegate = self
        toStateTextField.delegate = self
        toZipCodeTextField.delegate = self
    }
    
    @IBAction func fromStreetAddressTapped(sender: AnyObject) {
        
        changeResponder(fromStreetAddressTextField)
    }
    
    @IBAction func fromCityTapped(sender: AnyObject) {
        
        changeResponder(fromCityTextField)
    }
    
    
    @IBAction func fromStateTapped(sender: AnyObject) {
    }
    
    @IBAction func fromZipcodeTapped(sender: AnyObject) {
    }
    
    @IBAction func toStreetAddressTapped(sender: AnyObject) {
        
    }
    
    @IBAction func toCityTapped(sender: AnyObject) {
        
    }
    
    
    @IBAction func toStateTapped(sender: AnyObject) {
        
    }
    
    @IBAction func toZipcodeTapped(sender: AnyObject) {
        
    }
    
    @IBAction func chooseDateAndTimeTapped(sender: AnyObject) {
        datePicker.hidden = false
        doneButton.hidden = false
        notes.hidden = true
        
        //need to reload data
        
        
    }
    
    @IBAction func doneTapped(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        dateLabel.text = strDate
        datePicker.hidden = true
        notes.hidden = false
    }
    
    //to display alert for errors
    func displayMyAlertMessage(title: String, message: String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
    
    func changeResponder(textField: UITextField){
        if textField.isFirstResponder(){
            textField.resignFirstResponder()
            print("dismiss respone")
        }
        else{
            textField.becomeFirstResponder()
            print("become first repsonder")
        }
    }

}

extension CreateNewRideViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(textField: UITextField) {
        print("test")
    }
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        print("tessdft")
        return true
    }
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}