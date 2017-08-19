import Foundation
import Alamofire

class OrderGetter {
    
    var bronzeBagCount = 0.0
    var targetItem = "Awesome Bronze Bag"
    
    var batzTotalSpent = 0.0
    var targetEmail = "napoleon.batz@gmail.com"
    
    let ordersURL = URL(string: "https://shopicruit.myshopify.com/admin/orders.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")!
    
    func getOrders(completed: @escaping () -> Void) {
        
        Alamofire.request(ordersURL).responseJSON(completionHandler: { response in
            let result = response.result
            
            if let orderData = result.value! as? [String : Any] {
                
                for data in orderData {
                    
                    if let orders = data.1 as? NSArray {
                        
                        for order in orders {
                            
                            if let order = order as? [String : Any] {
                                
                                // question 1
                                let email = order["email"] as? String
                                
                                if email == self.targetEmail {
                                    let totalPrice = (order["total_price"] as? NSString)!.doubleValue
                                    self.batzTotalSpent += totalPrice
                                }

                                // question 2
                                let lineItems = order["line_items"]! as? [[String: Any]]
                                
                                for item in lineItems! {
                                    let itemTitle = String(describing: item["title"]!)
                                    
                                    if itemTitle == self.targetItem {
                                        let itemQuantity = item["quantity"]! as? Double
                                        self.bronzeBagCount += itemQuantity!
                                        
                                    }
                                }
                                
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            } else {
                
                print("Something went wrong with getOrders")
                
            }
            
            completed()
            
        })
        
    }
    
}
