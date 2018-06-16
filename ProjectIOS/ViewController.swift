//
//  ViewController.swift
//  ProjectIOS
//
//  Created by Treinamento on 12/05/2018.
//  Copyright © 2018 Treinamento. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var inputNome: UITextField!
    @IBOutlet weak var inputSobrenome: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputSenha: UITextField!
    @IBOutlet weak var inputCelular: UITextField!
    
    @IBOutlet weak var btnSN: UISegmentedControl!
    @IBOutlet weak var btnEntrar: UIButton!
    
    var refViewController: DatabaseReference!
    
    var valueWhatsAppSN: String = "N"
    
    @IBAction func btnCadastro(_ sender: UIButton) {
        
        if inputNome.text != "" ||
            inputSobrenome.text != "" ||
            inputEmail.text != "" ||
            inputSenha.text != "" ||
            inputCelular.text != ""{
            
            refViewController = Database.database().reference()
            let refCadastro = refViewController.child("Usuarios").childByAutoId()
            
            switch btnSN.selectedSegmentIndex
            {
                
            case 0:
                valueWhatsAppSN = "S"
            case 1:
                valueWhatsAppSN = "N"
            default:
                break
            }
            
            pushTelaLogin()
            
            refCadastro.child("Nome").setValue(inputNome.text)
            refCadastro.child("Sobrenome").setValue(inputSobrenome.text)
            refCadastro.child("Email").setValue(inputEmail.text?.lowercased())
            refCadastro.child("Senha").setValue(inputSenha.text)
            refCadastro.child("Celular").setValue(inputCelular.text)
            refCadastro.child("SnWhatsApp").setValue(valueWhatsAppSN)
            
            let email = inputEmail.text
            let password =  inputSenha.text
            
            Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
                
            }
            
            
            
        }else{
            print("Erro")
        }
        
    }
    
    func pushTelaLogin(){
        //Chama tela de login
        let storyLogin = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyLogin.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}






















































