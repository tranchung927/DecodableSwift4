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
    private var _weatherCurrent: Weather?
    var weatherCurrent: Weather? {
        get {
            if _weatherCurrent == nil {
                updateData()
            }
            return _weatherCurrent
        }
        set {
            _weatherCurrent = newValue
        }
    }
    
    func updateData() {
        let urlString = "https://api.apixu.com/v1/current.json?key=719891bd775c4b8fb3510302172007&q=Paris"
        guard let url = URL(string: urlString) else {return}
        requestAPI(request: url)
    }
    
    func requestAPI(request: URL) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {return}
            do {
                self.weatherCurrent = try JSONDecoder().decode(Weather.self, from: data)
                NotificationCenter.default.post(name: notificationJSON, object: nil)
                
            } catch let error {
                print("\(error)")
            }
        }
        task.resume()
    }
}
