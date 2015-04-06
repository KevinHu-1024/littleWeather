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

struct LocationInfo {
    var longitude = "0.0"
    var latitude = "0.0"
}


class LocationService: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var locationInfo = LocationInfo()
    
    func on ( ) {
        
        locationManager.delegate = self
        locationManager.distanceFilter = 200
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        locationManager.requestWhenInUseAuthorization()
//        locationManager.startMonitoringSignificantLocationChanges()
        locationManager.startUpdatingLocation()
        
    }
    
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location : CLLocation = locations [locations.count-1] as CLLocation
        if (location.horizontalAccuracy > 0){
            locationInfo . longitude = toString(location.coordinate.longitude)
            locationInfo . latitude = toString(location.coordinate.latitude)
            println("updated!")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch (status) {
        case CLAuthorizationStatus.NotDetermined :
            if ( self.locationManager .respondsToSelector("requestWhenInUseAuthorization")) {
                self.locationManager.requestWhenInUseAuthorization()
            }
        default: break
        }
    }

}