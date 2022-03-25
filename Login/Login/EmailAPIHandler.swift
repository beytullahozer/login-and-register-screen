//
//  EmailAPI.swift
//  Invoice Maker
//
//  Created by Tuna Öztürk on 20.03.2022.
//

import Foundation

class EmailAPIHandler{

    
    
    func sendEmail(toEmail: String, code: String){
        
     

        let headers = [
            "content-type": "application/json",
            "x-rapidapi-host": "easymail.p.rapidapi.com",
            "x-rapidapi-key": "29ffc0deb1mshd5df9e07c899dd2p1c3441jsneb4da8229ef0"
        ]
        let parameters = [
            "from": ["name": "Invoice Maker App"],
            "to": [
                "address": "\(toEmail)"
            ],
            "subject": "Change Your Password",
            "message": "Need to reset your password? Use your secret code! Here is your 6-digits code : \(code). Open the Invoice Maker App and enter the secret code. If you did not forget your password, you can ignore this email.",
            "show_noreply_warning": false
        ] as [String : Any]

        do {
    
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
                    
            let request = NSMutableURLRequest(url: NSURL(string: "https://easymail.p.rapidapi.com/send")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
            })
        
            dataTask.resume()
            
        }
        catch {
      
            print("There is a problem")
        }
        

        
 
    }

}
