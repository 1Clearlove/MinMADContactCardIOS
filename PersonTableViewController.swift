//
//  PersonTableViewController.swift
//  Contact Card
//
//  Created by Mathieu Knook on 19/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var persons = [Person]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPersonData()
        //loadSamplePersons()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PersonTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PersonTableViewCell
        else {
            fatalError("The dequeued cell is not an instance of PersonTableViewCell.")
        }
            
        let person = persons[indexPath.row]

        cell.nameLabel.text = person.name
        cell.personImage.image = person.photo

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPerson" {
            if let destination = segue.destination as? SummaryViewController {
                if let IndexPath = self.tableView.indexPathForSelectedRow {
                    let person = persons[IndexPath.row]
                    destination.person = person
                }
            }
        }
    }
    
    
    func getPersonData(){
        let connection = RestApiManager.sharedInstance
        connection.getPersons( {(json: NSDictionary?, error: NSError?) -> Void in
            
            if(error == nil) {
                
                // Get personsarray
                let resultObject = json?.object(forKey: "results") as? NSArray
                
                // for every person in the array
                for results in resultObject! {
                    
                    let result = results as! NSObject
                    
                    let nameObject = result.value(forKey: "name") as? NSObject
                    let firstNameString = nameObject?.value(forKey: "first") as? String
                    let lastNameString = nameObject?.value(forKey: "last") as? String
                    let name = firstNameString! + lastNameString!
                    
                    //let locationObject = result.value(forKey: "location") as? NSObject
                    //let streetString = locationObject?.value(forKey: "street") as? String
                    //let cityString = locationObject?.value(forKey: "city") as? String
                    //let stateString = locationObject?.value(forKey: "state") as? String
                    
                    //let pictureObject = result.value(forKey: "picture") as? NSObject
                    //let largeString = pictureObject?.value(forKey: "large") as? String
                    //let mediumString = pictureObject?.value(forKey: "medium") as? String
                    //let thumbnailString = pictureObject?.value(forKey: "thumbnail") as? String
                    
                    //let emailString = result.value(forKey: "email") as? String
                    let person = Person(name: name)
                    
                    
                    // ! Important, alleen op de main thread UI update!
                    DispatchQueue.main.async(execute: {
                        self.persons.append(person)
                        self.tableView.reloadData()
                    })
                }
            } else {
                print(error!.localizedDescription)
            }
        })
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK: Private Methods
    private func loadSamplePersons() {
        let photo1 = UIImage(named: "profilePicture")
        let photo2 = UIImage(named: "profile2")
        let photo3 = UIImage(named: "profile3")
        
        guard let person1 = Person(name: "Jackie Chan", photo: photo1) else {
            fatalError("Unable to instantiate person1")
        }
        
        guard let person2 = Person(name: "Tom Jones", photo: photo2) else {
            fatalError("Unable to instantiate person2")
        }
        
        guard let person3 = Person(name: "Claude Reide", photo: photo3) else {
            fatalError("Unable to instantiate person3")
        }
        
        persons += [person1, person2, person3]
    }

}
