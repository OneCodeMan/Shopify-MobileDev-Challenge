import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var customerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerTableView.dataSource = self
        customerTableView.delegate = self
        
        title = "Your Customers"
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // change this
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customerTableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath)
        
        cell.textLabel?.text = "bro"
    
        return cell
          
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
