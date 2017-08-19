import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var bronzeBagsLabel: UILabel!
    
    let orderModel = OrderGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your Customers"
        
        orderModel.getOrders {
            print("done")
        }
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
