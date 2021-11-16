//
//  ServiceManager.swift
//  Mina
//
//  Created by Mohammed Saleh on 4/16/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ServiceManager: NSObject {
    
    typealias ApiResponse = (JSON?, JSON?) -> Void
    
    class func callAPI(url: String, method: HTTPMethod, parameters: [String: Any]?, custumHeaders: HTTPHeaders?, onCompletion: @escaping ApiResponse) -> Void
    {
        var headers: HTTPHeaders!
        headers = ["Content-Type": "application/json"]
        
        print("===============================================")
        print("url = \(url)")
        print("headers = \(headers ?? [:])")
        print("parameters = \(parameters ?? [:])")
        print("===============================================")
        
        AF.request(URL(string: url.addingPercentEncoding())!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                switch response.result {
                    case .success:
                        if let responseCode = response.response?.statusCode, responseCode >= 200 && responseCode < 300 {
                            print(response)
                            onCompletion(nil, JSON(response.value as Any))
                        }else{
                            print(response)
                            onCompletion(JSON(response.data as Any), nil)
                        }
                    case .failure:
                        onCompletion(JSON(response), nil)
                }
            }
    }
    
    class func callAPIWithImagesAndVideos(url:  String, method: HTTPMethod, parameters: [String: Any]?, custumHeaders: HTTPHeaders?, onCompletion: @escaping ApiResponse) -> Void {
        
        var headers: HTTPHeaders!
        headers = ["Content-Type": "multipart/form-data"]
        
        print("===============================================")
        print("url = \(url)")
        print("headers = \(headers ?? [:])")
        print("parameters = \(parameters ?? [:])")
        print("===============================================")
        
        AF.upload(multipartFormData: { multipartFormData in
            
            for key in parameters!.keys {
                
                if let image = parameters![key] as? UIImage {
                    
                    if let imageData = image.jpegData(compressionQuality: 0.50) {
                        multipartFormData.append(imageData, withName: key, fileName: "image.png", mimeType: "image/png")
                    }
                    
                }else if let val = parameters![key] as? Int {
                    
                    multipartFormData.append((String(val) as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }else if let videoUrl = parameters![key] as? URL {
                    let videoData = try! Data(contentsOf: videoUrl, options: Data.ReadingOptions.alwaysMapped)
                    multipartFormData.append(videoData, withName: key, fileName: "video/mp4", mimeType: "video/mp4")
                    
                }else {
                    multipartFormData.append((parameters![key] as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
            }
        },to: url, usingThreshold: 6000, method: .post, headers: headers)
        .uploadProgress(queue: .main, closure: { progress in
            //Current upload progress of file
            print("Upload Progress: \(progress.fractionCompleted)")
        })
        .responseJSON(completionHandler: { response in
            switch response.result {
                case .success:
                    if let responseCode = response.response?.statusCode, responseCode >= 200 && responseCode < 300 {
                        print(response)
                        onCompletion(nil, JSON(response.value as Any))
                    }else{
                        print(response)
                        onCompletion(JSON(response.data as Any), nil)
                    }
                case .failure:
                    onCompletion(JSON(response), nil)
            }
        })
    }
}
