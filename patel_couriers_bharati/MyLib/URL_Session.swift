//
//  URL_SessionVC.swift
//  Fresh Fishco
//
//  Created by Swapnil Dhavan on 27/01/21.
//

import UIKit
import MobileCoreServices

class URL_Session {
    
    
    static let shared = URL_Session()
    
    func postData(viewController: UIViewController, url: String, parameters: [String:Any], completion: @escaping (Data?) -> Void) {
        if viewController.noInternet(){return}
        do {
            
        
        let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
          //  print("data123: ", String(data: data, encoding: .utf8)!)
            
            print("url: ", url)
            print("param: ", parameters)
        
        var request = URLRequest(url: URL(string: url)!)
        
        request.httpMethod = "POST"
        //let postString = self.getPostString(params: parameters)
        //request.httpBody = postString.data(using: .utf8)
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(MyConfig.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
        //request.setValue("application/json", forHTTPHeaderField: "Accept")
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
        request.timeoutInterval = 180
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if (error != nil) {
                print("error: ",error)
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: error?.localizedDescription, actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                   // print("error: ",httpresponse)
                    //viewController.popupAlert(title: nil, message: "We are optimizing server performance,\nCurrently server is unable to process your request,\nPlease try latter!", actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            
            /* guard let mime = response?.mimeType, mime == "application/json" else {
             print("Wrong MIME type!")
             return
             }*/
            
            if let data = data {
                let json = JSON(data as Any)
                print("Data: ", json)
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            
        }.resume()
            
        }catch{
               }
        
        //  let json1 = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
        //print("json1: ", json1)
        
    }
    
    func getData(viewController: UIViewController, url: String, parameters: [String:Any], completion: @escaping (Data?) -> Void) {
        if viewController.noInternet(){return}
        do {
            
        
        let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
          //  print("data123: ", String(data: data, encoding: .utf8)!)
            
            print("url: ", url)
            print("param: ", parameters)
            
    
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let postString = self.getPostString(params: parameters)
        request.httpBody = postString.data(using: .utf8)
        //request.httpBody = data
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.setValue(MyConfig.ACCESS_TOKEN, forHTTPHeaderField: "Authorization")
        //request.setValue("application/json", forHTTPHeaderField: "Accept")
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
       
        request.timeoutInterval = 180
        
        URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            
            if (error != nil) {
                print("error: ",error)
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: error?.localizedDescription, actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                   // print("error: ",httpresponse)
                    //viewController.popupAlert(title: nil, message: "We are optimizing server performance,\nCurrently server is unable to process your request,\nPlease try latter!", actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            
            /* guard let mime = response?.mimeType, mime == "application/json" else {
             print("Wrong MIME type!")
             return
             }*/
            
            if let data = data {
                let json = JSON(data as Any)
                print("Data: ", json)
                DispatchQueue.main.async {
                    completion(data)
                }
            }
            
        }.resume()
            
        }catch{
               }
        
        //  let json1 = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
        //print("json1: ", json1)
        
    }
    
    func getPostString(params:[String:Any]) -> String
    {
        var data = [String]()
        for(key, value) in params
        {
            data.append(key + "=\(value)")
        }
        return data.map { String($0) }.joined(separator: "&")
    }
    
    
    //func UploadImageWithData(parameters:[String:NSObject], filePathKey:String, boundary:String) -> NSData {
    //func UploadImageWithData(parameters:[String:NSObject], filePathKey:String, boundary:String) -> NSData {
    
    func UploadImageWithData(viewController: UIViewController, url: String, parameters:[String:String], imageName:String, image: UIImage, completion: @escaping (Data?) -> Void){
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        //let postString = self.getPostString(params: parameters)
        //request.httpBody = postString.data(using: .utf8)
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 180
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let body = NSMutableData()
        
        for (key, value) in parameters {
            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString(string: "\(value)\r\n")
        }
        
        
        //**************************FoR IMAGE*********************//
        body.appendString(string: "--\(boundary)\r\n")
        
        let mimetype = "image/jpg"
        let defFileName = "image.jpg"
        let imageData = image.jpegData(compressionQuality: 0.5)
        
        body.appendString(string: "Content-Disposition: form-data; name=\"\(imageName)\"; filename=\"\(defFileName)\"\r\n")
        body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
        body.append(imageData!)
        body.appendString(string: "\r\n")
        
        body.appendString(string: "--\(boundary)--\r\n")
        
        //**************************FoR IMAGE*********************//
        
        //URLSession.shared.uploadTask(with: <#T##URLRequest#>, from: <#T##Data?#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        // Send a POST request to the URL, with the data we created earlier
        URLSession.shared.uploadTask(with: request as URLRequest, from: body as Data, completionHandler: { data, response, error in
            if (error != nil) {
                print(error)
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: error?.localizedDescription, actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                print ("server error")
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: "We are optimizing server performance,\nCurrently server is unable to process your request,\nPlease try latter!", actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    let json = JSON(data as Any)
                    print("Data: ", json)
                    completion(data)
                }
            }
        }).resume()
    }
    
    func UploadMultiDocumentWithData(viewController: UIViewController, url: String, parameters:[String:Any], fileName:String, file_path_arr: [String:Data], completion: @escaping (Data?) -> Void){
        
        let param = parameters
       // let api_token = (Pref.getPref(key: Constants.shared.API_TOKEN) as? String)
      //  if api_token != nil{
     //       param["api_token"] = api_token
     //   }
        
        // generate boundary string using a unique per-app string
        let boundary = UUID().uuidString
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        //let postString = self.getPostString(params: parameters)
        //request.httpBody = postString.data(using: .utf8)
        //request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 180
        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
        // And the boundary is also set here
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        
        let body = NSMutableData()
        
        for (key, value) in param {
            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: "Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
            body.appendString(string: "\(value)\r\n")
        }
        
        //**************************FoR File*********************//
        body.appendString(string: "--\(boundary)\r\n")
        
        print("param: ", param)
    
        var i = 0;
        for (filePath, data) in file_path_arr {
           
            print("mime_path: ", mimeTypeForPath(path: filePath))
            var mimetype = ""
            let defFileName = "image\(i).jpeg"
            if !filePath.isEmpty{
                mimetype = mimeTypeForPath(path: filePath)
                //defFileName = (filePath as NSString).lastPathComponent
            }
            
            let docData = data
            
            let file = "Content-Disposition: form-data; name=\"\(fileName+"[\(i)]")\"; filename=\"\(defFileName)\"\r\n"
            
            print("data: ",file)
            body.appendString(string: "--\(boundary)\r\n")
            body.appendString(string: file)
            body.appendString(string: "Content-Type: \(mimetype)\r\n\r\n")
            body.append(docData)
            body.appendString(string: "\r\n")
            //body.appendString(string: "\r\n--\(boundary)--")
            body.appendString(string: "--\(boundary)--\r\n")
            i+=1;

        }
        body.appendString(string: "--\(boundary)--\r\n")
        
        
        //**************************FoR File*********************//
        
        //URLSession.shared.uploadTask(with: <#T##URLRequest#>, from: <#T##Data?#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
        
        // Send a POST request to the URL, with the data we created earlier
        URLSession.shared.uploadTask(with: request as URLRequest, from: body as Data, completionHandler: { data, response, error in
            
            print("data: ",String(data: data!, encoding: .utf8)!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                            print(json)
                        } catch {
                            print(error)
                        }
            if (error != nil) {
                print(error)
                LoadingOverlay.shared.hideOverlayView()
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: error?.localizedDescription, actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            guard let httpresponse = response as? HTTPURLResponse,
                  (200...299).contains(httpresponse.statusCode) else {
                LoadingOverlay.shared.hideOverlayView()
                print ("server error")
                DispatchQueue.main.async {
                    //viewController.popupAlert(title: nil, message: "We are optimizing server performance,\nCurrently server is unable to process your request,\nPlease try latter!", actions: nil)
                    self.ServerError(viewController: viewController)
                }
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completion(data)
                }
            }
        }).resume()
    }
    
    func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    func ServerError(viewController: UIViewController) {
        let mainStoryBoard:UIStoryboard = UIStoryboard(name: "ServerError",bundle: nil)
        let desC = mainStoryBoard.instantiateViewController(withIdentifier: "ServerErrorVC") as! ServerErrorVC
        let navigationController = UINavigationController(rootViewController: desC)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.navigationBar.isHidden = true
        desC.viewController = viewController
        viewController.present(navigationController, animated:true, completion:nil)
    }
    
    func mimeTypeForPath(path: String) -> String {
        let url = NSURL(fileURLWithPath: path)
        let pathExtension = url.pathExtension

        if let uti = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, pathExtension! as NSString, nil)?.takeRetainedValue() {
            if let mimetype = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)?.takeRetainedValue() {
                return mimetype as String
            }
        }
        return "application/octet-stream"
    }
}

extension NSMutableData {
    func appendString(string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: true)
        append(data!)
    }
}
