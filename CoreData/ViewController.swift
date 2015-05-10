//
//  ViewController.swift
//  CoreData
//
//  Created by Nick Ludlow on 05/05/2015.
//  Copyright (c) 2015 Nick Ludlow. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var appDel: AppDelegate = AppDelegate()
    var context: NSManagedObjectContext = NSManagedObjectContext()
    
    
    @IBAction func addUser(sender: AnyObject) {
        
        if firstName.text == "" || lastName.text == "" || email.text == "" || phone.text == "" {
        
            var alert = UIAlertController(title: "Error", message: "All inputs are mandatory", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        
        }else{
            
            println("Data for the new user seems to be fine.")
            
            var newUser = NSEntityDescription.insertNewObjectForEntityForName("Contacts", inManagedObjectContext: context) as! NSManagedObject
            
            newUser.setValue(firstName.text, forKey: "firstName")
            newUser.setValue(lastName.text, forKey: "lastName")
            newUser.setValue(email.text, forKey: "email")
            newUser.setValue(phone.text, forKey: "phone")
            
            context.save(nil)
            
            var alertSave = UIAlertController(title: "Great", message: "The record has been saved", preferredStyle: .Alert)
            alertSave.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertSave, animated: true, completion: nil)
            
        
        }
        
    self.view.endEditing(true)
        
        
    }


    @IBAction func firstNameSearch(sender: AnyObject) {
        
        var request = NSFetchRequest(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        
        request.predicate = NSPredicate(format: "First Name = %@", "\(firstName.text)")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        //println(results![0].valueForKey("First Name")!)
        
        if results!.count > 0 {
        
            firstNameLabel.text = results![0].valueForKey("First Name")! as? String
            lastNameLabel.text = results![0].valueForKey("Last Name")! as? String
            emailLabel.text = results![0].valueForKey("Email")! as? String
            phoneLabel.text = results![0].valueForKey("Phone")! as? String
            
        }else{
        
            println("No Records Found")
        
        }
        
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func lastNameSearch(sender: AnyObject) {
        
        var request = NSFetchRequest(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        
        request.predicate = NSPredicate(format: "Last Name = %@", "\(lastName.text)")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        //println(results![0].valueForKey("Last Name")!)
        
        if results!.count > 0 {
            
            firstNameLabel.text = results![0].valueForKey("First Name")! as? String
            lastNameLabel.text = results![0].valueForKey("Last Name")! as? String
            emailLabel.text = results![0].valueForKey("Email")! as? String
            phoneLabel.text = results![0].valueForKey("Phone")! as? String
            
        }else{
            
            println("No Records Found")
            
        }
        
        self.view.endEditing(true)
        
    }
    
    
    @IBAction func emailSearch(sender: AnyObject) {
        
        var request = NSFetchRequest(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        
        request.predicate = NSPredicate(format: "Email = %@", "\(email.text)")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        //println(results![0].valueForKey("Email")!)
        
        if results!.count > 0 {
            
            firstNameLabel.text = results![0].valueForKey("First Name")! as? String
            lastNameLabel.text = results![0].valueForKey("Last Name")! as? String
            emailLabel.text = results![0].valueForKey("Email")! as? String
            phoneLabel.text = results![0].valueForKey("Phone")! as? String
            
        }else{
            
            println("No Records Found")
            
        }
        
        self.view.endEditing(true)
        
        
    }
    
    
    @IBAction func phoneSearch(sender: AnyObject) {
        
        var request = NSFetchRequest(entityName: "Contacts")
        request.returnsObjectsAsFaults = false
        request.resultType = NSFetchRequestResultType.DictionaryResultType
        
        request.predicate = NSPredicate(format: "Phone = %@", "\(phone.text)")
        
        var results = context.executeFetchRequest(request, error: nil)
        
        //println(results![0].valueForKey("Phone")!)
        
        if results!.count > 0 {
            
            firstNameLabel.text = results![0].valueForKey("First Name")! as? String
            lastNameLabel.text = results![0].valueForKey("Last Name")! as? String
            emailLabel.text = results![0].valueForKey("Email")! as? String
            phoneLabel.text = results![0].valueForKey("Phone")! as? String
            
        }else{
            
            println("No Records Found")
            
        }
        
        self.view.endEditing(true)
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
                
        appDel = UIApplication.sharedApplication().delegate as! AppDelegate
        context = appDel.managedObjectContext!
        
        firstNameLabel.text = ""
        lastNameLabel.text = ""
        emailLabel.text = ""
        phoneLabel.text = ""
        
        firstName.delegate = self
        lastName.delegate = self
        email.delegate = self
        phone.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

