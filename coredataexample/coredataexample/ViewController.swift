//
//  ViewController.swift
//  coredataexample
//
//  Created by Piero Silvestri on 08/06/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var people: [String] = [];

    @IBOutlet weak var tableViewPeople: UITableView!
    
    let container = (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Remove unused cell
        tableViewPeople.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let managedContext = self.container.viewContext
        let persons:[Person]
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        // Metodo per recuperare i dati dal database
        do{
            persons = try managedContext.fetch(fetchRequest)
            people = persons.map({ (person: Person) in
                return person.name!
            })
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }

    @IBAction func add(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Inserimento", message: "Aggiungi persona.", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField) -> Void in
            textField.placeholder = "Login"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (result : UIAlertAction) -> Void in
            print("Cancel")
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            let textValue = alertController.textFields?.first?.text
            self.people.append(textValue!)
            self.tableViewPeople.reloadData()
            let managedContext = self.container.viewContext
            let person: Person = NSEntityDescription.insertNewObject(forEntityName: "Person", into: managedContext) as! Person
            person.name = textValue
            do{
                try managedContext.save()
            }catch let error as NSError{
                print("Could not fetch. \(error), \(error.userInfo)")
            }
        }
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // Il punto di domanda la variabile può essere nil
        // Il punto escalamativo dice che la variabile non può essere nil
        print(textField.text!);
        return true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = person
        return cell
    }
    
    
    
}

