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

    var people: [Person] = [];

    @IBOutlet weak var tableViewPeople: UITableView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
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
        let container = self.appDelegate.persistentContainer
        let managedContext = container.viewContext
        let persons:[Person]
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        // Metodo per recuperare i dati dal database
        do{
            persons = try managedContext.fetch(fetchRequest)
            people = persons.map({ (person: Person) in
                return person
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
            let flag = self.save(name: textValue!)
            if(flag){
                self.tableViewPeople.reloadData()
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
        
        cell.textLabel?.text = person.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete"){
            (action, indexPath) in
            print("Delete")
            let container = self.appDelegate.persistentContainer
            let context = container.viewContext
            do{
                context.delete(self.people[indexPath.row])
                self.people.remove(at: indexPath.row)
                self.tableViewPeople.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
                try context.save()
            }catch let error as NSError{
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
        let edit = UITableViewRowAction(style: .normal, title: "Edit"){
            (action, indexPath) in
            let alert = UIAlertController(title: "modifica", message: "Modifica elemento", preferredStyle: UIAlertControllerStyle.alert)
            let defaultAction = UIAlertAction(title: "modifica", style: UIAlertActionStyle.default){
                (UIAlertAction) in
                print("Modifica Elemento")
                let person = self.people[indexPath.row]
                person.name = alert.textFields?[0].text
                self.tableViewPeople.reloadData()
                self.appDelegate.saveContext()
            }
            let cancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addTextField{
                (textField : UITextField) in
                // textField.delegate = self
            }
            alert.addAction(defaultAction)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
        
        return  [delete, edit]
    }
    
    /*
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    */
    
    func save(name: String) -> Bool{
        let container = self.appDelegate.persistentContainer
        let context = container.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: context)
        let person = NSManagedObject(entity: entity!, insertInto: context)
        
        person.setValue(name, forKey: "name")
        do{
            try context.save()
            people.append(person as! Person)
        }catch let error as NSError{
            print("Could not save. \(error), \(error.userInfo)")
            return false
        }
        
        return true
    }
    
    func deleteItem(indexPath: IndexPath) -> Bool{

        let container = self.appDelegate.persistentContainer
        let context = container.viewContext
        let persons:[Person]
        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        let predicate = NSPredicate(format: "name contains[c] %@", (self.tableViewPeople.cellForRow(at: indexPath)?.textLabel?.text)!)
        fetchRequest.predicate = predicate
        // Metodo per recuperare i dati dal database
        do{
            persons = try context.fetch(fetchRequest)
            context.delete(persons.first!)
            print("Cancellato")
        }catch let error as NSError{
            print("Could not fetch. \(error), \(error.userInfo)")
            return false
        }
        
        return true
    }
    
}

