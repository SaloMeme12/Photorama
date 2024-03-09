//
//  FlickerAPI.swift
//  PhotoramaApp
//
//  Created by Mcbook Pro on 07.03.24.
//

import Foundation

enum EndPoint: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

struct FlickerAPI {
 // rensonsibilitie: knowing how to generate the URLs that the Flickr API expects
 // parse that JSON
    
    private static let baseURLString = "https://api.flickr.com/services/rest"
    private static var apiKey = "dfcd40374175a69166b5612380c711a1"
    
    static var interestingPhotosURL: URL {
        return flickrURL(endPoint: .interestingPhotos,
                         parameters: ["extras": "url_z,date_taken"])
    }
    //Finish implementing flickrURL(endPoint:parameters:) to add the common query items to the URLComponents.
    
    // ACtual func for constructing URL
    private static func flickrURL(endPoint:EndPoint, parameters: [String:String]?)-> URL{
        var components = URLComponents(string: baseURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "method": endPoint.rawValue,
            "format": "json",
            "nojsoncallback": "1",
            "api_key": apiKey
        ]
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        return components.url!
    }
    
}

