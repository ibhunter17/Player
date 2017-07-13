//
//  AddPlayer.swift
//  Player
//
//  Created by Nitish Dang on 2017-07-12.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class AddPlayer: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var age: UITextField!
    var countryselected=""
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    let country=["France","Germany","USA","Spain","Australia"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate=self
        picker.dataSource=self
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
        countryselected=country[row]
    }

   
    @IBAction func addPlayer(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let player=Players(context: context)
        player.name=name.text!
        player.country=countryselected
        player.height=Float(height.text!)!
        player.age=Int16(age.text!)!
        player.weight=Float(weight.text!)!
        appDelegate.saveContext()
        name.text=""
        height.text=""
        age.text=""
        weight.text=""

    }
}
