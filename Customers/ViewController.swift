import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let orderModel = OrderGetter()

    @IBOutlet weak var customerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerTableView.dataSource = self
        customerTableView.delegate = self
        
        title = "Your Customers"
        
        orderModel.getOrders {
            print("done")
        }
        
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
