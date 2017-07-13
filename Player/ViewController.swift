//
//  ViewController.swift
//  Player
//
//  Created by Nitish Dang on 2017-07-12.
//  Copyright © 2017 Nitish Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var Player: [Players] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate=self
        tableview.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        //Get Data from Core Data
        GetData()
        //ReloadData
        tableview.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Player.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "procell", for: indexPath) as! CustomTableViewCell
        let player=Player[indexPath.row]
        cell.name.text="Name:"+player.name!
        let country=player.country!
        cell.imageView?.image=UIImage(named: "\(country)")
        cell.age.text="Age:"+String(player.age)

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "detailedView") as! DetailedView
        nextViewController.player=Player[indexPath.row]
        self.present(nextViewController, animated:true, completion:nil)
    }
   
    func GetData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
          Player=try context.fetch(Players.fetchRequest())
        }catch {
            print("Fetching failed")
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        if editingStyle == .delete{
            
            let player=Player[indexPath.row]
            context.delete(player)
            appDelegate.saveContext()
            do{
                Player=try context.fetch(Players.fetchRequest())
            }catch {
                print("Fetching failed")
            }
        }
        tableview.reloadData()
    }
}

