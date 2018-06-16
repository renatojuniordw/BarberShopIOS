import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputSenha: UITextField!
    
    var ref: DatabaseReference!

    @IBAction func btnEntrar(_ sender: UIButton) {
        
        if inputEmail.text != "" || inputSenha.text != "" {
            performSegue(withIdentifier:"SegueMenu", sender: self)
            
        }
        
        inputEmail.text = ""
        inputSenha.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        ref.child("Agendamentos").observeSingleEvent(of: .value, with: { (snapshot) in
            print("Usuario aqui \n\n\n\n\n\n")
            
           //let value = snapshot.value as? NSDictionary
            //let username = value?["Email"] as? String ?? ""
            print(snapshot)
            
            print("\n\n Usuario aqui \n\n\n\n")
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
