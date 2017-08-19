import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var bronzeBagsLabel: UILabel!
    
    let orderModel = OrderGetter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your Customers"
        
        orderModel.getOrders {
            
            let bronzeBagCount = Int(self.orderModel.bronzeBagCount)
            self.bronzeBagsLabel.text? = String(describing: bronzeBagCount)
            
            let totalSpent = Double(self.orderModel.batzTotalSpent)
            self.totalPriceLabel.text? = "$\(String(describing: totalSpent)) CAD"
        }
        
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
