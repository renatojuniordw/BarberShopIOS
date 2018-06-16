//
//  AgendaViewController.swift
//  ProjectIOS
//
//  Created by Treinamento on 19/05/2018.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class AgendaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref: DatabaseReference!
    var arr: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("Agendamentos").observeSingleEvent(of: .value, with: { (snapshot) in
            //print(snapshot)
            let val = snapshot.value as! NSDictionary
            for element in val {
                
                print("Usuario aqui \n\n\n\n\n\n")
                let data = element.value as! [String:Any]

                if let day = data["day"] {
                    if let month = data["month"] {
                        if let year = data["year"] {
                            var aux = "\(day) - \(month) - \(year)"
                            self.arr.append(aux)
                        }
                    }
                }
                
                print(self.arr)
            }
            
            }) { (error) in
            print(error.localizedDescription)
        }
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
