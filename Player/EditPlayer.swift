//
//  EditPlayer.swift
//  Player
//
//  Created by Nitish Dang on 2017-07-13.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class EditPlayer: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var playertobeEdited:Players!
       let country=["France","Germany","USA","Spain","Australia"]
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Age: UITextField!
    var Countryselected=""
    @IBOutlet weak var Weight: UITextField!
    @IBOutlet weak var Height: UITextField!
    @IBOutlet weak var Picker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.delegate=self
        Picker.dataSource=self
        Name.text=playertobeEdited.name!
        Age.text=String(playertobeEdited.age)
        Weight.text=String(playertobeEdited.weight)
        Height.text=String(playertobeEdited.height)
        Countryselected=playertobeEdited.country!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return country.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return country[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Countryselected=country[row]
    }

    @IBAction func editButton(_ sender: Any) {
    
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        playertobeEdited.setValue(Name.text!, forKey: "name")
         playertobeEdited.setValue(Countryselected, forKey: "country")
        playertobeEdited.setValue(Int16(Age.text!), forKey: "age")
        playertobeEdited.setValue(Float(Height.text!), forKey: "height")
        playertobeEdited.setValue(Float(Weight.text!), forKey: "Weight")
        do {
            try context.save()
        }
        catch{
            print("Error")
        }
        Name.text=""
        Age.text=""
        Weight.text=""
        Height.text=""
    }


}
