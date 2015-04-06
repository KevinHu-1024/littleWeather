//
//  LocationService.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import CoreLocation

// LocationService 负责开启关闭定位，只对外输出经纬度， 只提供给WeatherService使用


//var axis: Dictionary = [ "longitude": "0.0", "laititude": "0.0" ]
//
//class LocationService: NSObject, CLLocationManagerDelegate {
//    
//    let locationManager = CLLocationManager()
//    
//    func on ( ) {
//        
//        locationManager.delegate = self
//        locationManager.distanceFilter = 200
//        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
//        locationManager.requestAlwaysAuthorization()
//        locationManager.startMonitoringSignificantLocationChanges()
////        locationManager.startUpdatingLocation()
//        
//    }
//    
//    
//    //MARK: - CLLocationManagerDelegate
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        var location : CLLocation = locations [locations.count-1] as CLLocation
//        if (location.horizontalAccuracy > 0){
//            axis ["longgitude"] = toString(location.coordinate.longitude)
//            axis ["laititude"] = toString(location.coordinate.latitude)
//        }
//    }
//    
//    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
//        println(error)
//    }
//}