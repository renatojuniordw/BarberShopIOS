import UIKit
import Firebase
import FirebaseAuth

class AgendaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref: DatabaseReference!
    var arr: [String] = []
    
    @IBOutlet weak var TableVIew: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        ref = Database.database().reference()
        ref.child("Agendamentos").observeSingleEvent(of: .value, with: { (snapshot) in
           
            let val = snapshot.value as! NSDictionary
            for element in val {

                let data = element.value as! [String:Any]

                if let day = data["day"] {
                    if let month = data["month"] {
                        if let year = data["year"] {
                            var aux = "\(day)/\(month)/\(year)"
                            self.arr.append(aux)
                        }
                    }
                }

            }
            
            self.TableVIew.delegate = self
            self.TableVIew.dataSource = self
            
            }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableVIew.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.arr[indexPath.row]
        //cell?.detailTextLabel?.text = "\(arr[indexPath.row])"
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
