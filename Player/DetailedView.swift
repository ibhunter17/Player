//
//  DetailedView.swift
//  Player
//
//  Created by Nitish Dang on 2017-07-12.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class DetailedView: UIViewController {

    @IBOutlet weak var countryimage:
    UIImageView!
    var player:Players!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Weight: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text="Name: "+player.name!
        Country.text="Country: "+player.country!
        let country=player.country!
        countryimage.image=UIImage(named: country)
        Age.text="Age: "+String(player.age)+" years old"
        Weight.text="Weight: "+String(player.weight)+" kg"
        Height.text="Height: "+String(player.height)+" cm"
        
        // Do any additional setup after loading the view.
    }

    @IBAction func edit(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "editView") as! EditPlayer
        nextViewController.playertobeEdited=player
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
