//
//  ViewController.swift
//  Swift_prova2
//
//  Created by Piero Silvestri on 27/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var namePassed : String? = ""
    var indexPassed : Int?
    var surnamePassed : String? = ""


    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var cognomiTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nomeTextField.placeholder = namePassed
        cognomiTextField.placeholder = surnamePassed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nameEditingDidEnd(_ sender: Any) {
        print("hai cambiato!")
    }
    @IBAction func salvaPressed(_ sender: Any) {
        
    }

    @IBAction func annullaPressed(_ sender: Any) {
        print(namePassed! + " " + surnamePassed!)
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func modificaPressed(_ sender: Any) {
    }
    
    @IBAction func cancellaPressed(_ sender: Any) {
        let alert = UIAlertController(title: "ciao", message: "come va?", preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ action in
                print("Hai premuto OK");
        })

        let annullaAction = UIAlertAction(title: "Annulla", style: UIAlertActionStyle.default, handler:{ action in
            print("Hai premuto annulla");
        })
        
        alert.addAction(okAction);
        alert.addAction(annullaAction)

        self.present(alert, animated: true, completion: nil)
    }
    

}

