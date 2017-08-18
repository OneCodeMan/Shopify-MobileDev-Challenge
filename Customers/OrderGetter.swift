import Foundation
import Alamofire

class OrderGetter {
    
    var orders: [Order] = []
    
    let ordersURL = URL(string: "https://shopicruit.myshopify.com/admin/orders.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")!
    
    func getOrders(completed: @escaping () -> Void) {
        
        Alamofire.request(ordersURL).responseJSON(completionHandler: { response in
            let result = response.result
            
            if let orderData = result.value! as? [String : Any] {
                
                for data in orderData {
                    
                    if let orders = data.1 as? NSArray {
                        
                        for order in orders {
                            
                            if let order = order as? [String : Any] {
                                // THIS IS WHERE YOU FINALLY EXTRACT THE DATA
                                print(order["email"]!)
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
