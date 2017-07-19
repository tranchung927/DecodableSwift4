//
//  DataService.swift
//  ParseJSON
//
//  Created by Tran Chung on 7/19/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit
let notificationJSON = Notification.Name.init("notificationJSON")
class DataServices {
    static let shared: DataServices = DataServices()
    
    var weatherCurrent: Weather? {
        didSet {
            updateData()
        }
    }
    
    func updateData() {
        let urlString = "https://api.apixu.com/v1/current.json?key=f3d902b438a3451c92605731171906&q=Paris"
        guard let url = URL(string: urlString) else {return}
        requestAPI(request: url)
    }
    
    func requestAPI(request: URL) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                let json = try JSONDecoder().decode(Weather.self, from: data)
                self.weatherCurrent = json
                NotificationCenter.default.post(name: notificationJSON, object: nil)
                
            } catch let error {
                print("\(error)")
            }
        }
        task.resume()
    }
}
