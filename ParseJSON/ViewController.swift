//
//  ViewController.swift
//  ParseJSON
//
//  Created by Tran Chung on 7/19/17.
//  Copyright © 2017 Tran Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.shared.updateData()
        resultJSON()
    }
    func resultJSON() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateWeather), name: notificationJSON, object: nil)
    }
    @objc func updateWeather() {
        self.weather = DataServices.shared.weatherCurrent
        guard let weatherSet = weather else {return}
        print("Name: \(weatherSet.location.name)\nCountry: \(weatherSet.location.country)\nIcon: http:\(weatherSet.current.condition.icon)")
        NotificationCenter.default.removeObserver(self)
    }
}


