//
//  MemoViewController.swift
//  MemoPad
//
//  Created by Rayne on 12/9/15.
//  Copyright © 2015 Kappa. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleToDoField: UITextField!
    @IBOutlet var titleGoalsThisWeekField: UITextField!
    @IBOutlet var titleAppointmentsField: UITextField!
    @IBOutlet var contentTextVew: UITextView!
    
    let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleToDoField.layer.borderColor = UIColor.blackColor().CGColor
        titleToDoField.layer.borderWidth = 1
        
        titleGoalsThisWeekField.layer.borderColor = UIColor.blackColor().CGColor
        titleGoalsThisWeekField.layer.borderWidth = 1
        
        titleAppointmentsField.layer.borderColor = UIColor.blackColor().CGColor
        titleAppointmentsField.layer.borderWidth = 1
        
        titleToDoField.text = saveData.objectForKey("ToDo") as! String?
        titleGoalsThisWeekField.text = saveData.objectForKey("GoalsThisWeek") as! String?
        titleAppointmentsField.text = saveData.objectForKey("Appointments") as! String?
        contentTextVew.text = saveData.objectForKey("content") as! String?
        
        titleToDoField.delegate = self
        titleGoalsThisWeekField.delegate = self
        titleAppointmentsField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SaveMemo() {
        
        saveData.setObject(titleToDoField.text, forKey: "ToDo")
        saveData.setObject(titleGoalsThisWeekField.text, forKey: "GoalsThisWeek")
        saveData.setObject(titleAppointmentsField.text, forKey: "Appointments")
        saveData.setObject(contentTextVew.text, forKey: "content")
        saveData.synchronize()
        
    
        let alert = UIAlertController(title: "Save Menu", message: "Saved", preferredStyle: UIAlertControllerStyle.Alert)
    
        alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertActionStyle.Default,
                    handler: {action in
                self.navigationController?.popToRootViewControllerAnimated(true)
                NSLog("OK button has been pressed")
                                }
    
                )
            )
        presentViewController(alert, animated: true, completion: nil)

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
