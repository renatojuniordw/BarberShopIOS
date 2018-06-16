//
//  MenuViewController.swift
//  ProjectIOS
//
//  Created by Treinamento on 19/05/2018.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class MenuViewController: UIViewController {

    var handle = Auth.auth().addStateDidChangeListener { (auth, user) in
        print(auth, user)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isToolbarHidden = true
        self.navigationItem.hidesBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnSair(_ sender: UIButton) {
        self.navigationController?.dismiss(animated: true, completion: {})
    }

}
