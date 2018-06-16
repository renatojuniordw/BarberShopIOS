import UIKit
import Firebase
import FirebaseAuth

class AgendamentoViewController: UIViewController {

    @IBOutlet weak var labelDateHour: UILabel!
    @IBOutlet weak var dateHour: UIDatePicker!
    @IBOutlet weak var btnAgendar: UIButton!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func agendar() {
        
        ref = Database.database().reference()
        
        let components = Calendar.current.dateComponents([.year, .month, .day], from: dateHour.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
            let referencia = ref.child("Agendamentos").childByAutoId()
            referencia.child("day").setValue(day)
            referencia.child("month").setValue(month)
            referencia.child("year").setValue(year)
            
            
        }
    }
    @IBAction func agendarBtn(_ sender: Any) {
        agendar()
        
    }
    
}
