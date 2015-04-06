//
//  WeatherService.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import Alamofire
import swiftyJSON
import CoreLocation

//WeatherService 接收来自LocationService 的经纬度信息，经由网络服务获得天气信息，解析并存入一个结构体



class WeatherService: NSObject , CLLocationManagerDelegate  {
    
//    let locationService = LocationService()
    
    var locationManager = CLLocationManager()
    
    func on ( ) {
        locationManager.delegate = self
        locationManager.distanceFilter = 200
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestAlwaysAuthorization()
//        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()

    }
    
    func test(){
        println(MainViewController.axis["longitude"])
    }
    
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location : CLLocation = locations [locations.count-1] as CLLocation
        if (location.horizontalAccuracy > 0){
            axis ["longgitude"] = toString(location.coordinate.longitude)
            axis ["laititude"] = toString(location.coordinate.latitude)
            println("updated!")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }

}
