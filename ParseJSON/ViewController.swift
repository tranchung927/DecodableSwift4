//
//  ViewController.swift
//  ParseJSON
//
//  Created by Tran Chung on 7/19/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.shared.updateData()
        resultJSON()
    }
    func resultJSON() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateWeather), name: notificationJSON, object: nil)
    }
    @objc func updateWeather() {
        guard let weather = DataServices.shared.weatherCurrent else {return}
        print("Name: \(weather.location.name)\nCountry: \(weather.location.country)\nIcon: http:\(weather.current.condition.icon)")
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}


