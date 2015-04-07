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
    var status: Bool = false
    var longitude = "none"
    var latitude = "none"
}


class LocationService: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var locationInfo = LocationInfo()
    
    func on ( ) {
        
        if CLLocationManager.locationServicesEnabled() {
            println("CLLocationManager.locationServicesEnabled!")
            switch CLLocationManager.authorizationStatus() {
            case CLAuthorizationStatus.Denied :
                println("CLAuthorizationStatus.Denied!")
                
            case CLAuthorizationStatus.NotDetermined : println("CLAuthorizationStatus.NotDetermined!")
                if self.locationManager.respondsToSelector("requestAlwaysAuthorization") {
                    self.locationManager.requestAlwaysAuthorization()
                    println("Requesting Always Authorization!")
                    locationManager.delegate = self
                    locationManager.distanceFilter = 200
                    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                    locationManager.startUpdatingLocation()
                    }
            default:
                println("OK!")
                locationManager.delegate = self
                locationManager.distanceFilter = 200
                locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                locationManager.startUpdatingLocation()
            }
        } else {
            println("CLLocationManager.locationServicesError!")
        }
    }
    
/////        locationManager.requestWhenInUseAuthorization()
//                    if self.locationManager.respondsToSelector("requestAlwaysAuthorization") {
//                        println("requestAlwaysAuthorization")
//                        self.locationManager.requestAlwaysAuthorization()
//

//    significantLocationChangeMonitoringAvailable() ????
//        locationManager.requestAlwaysAuthorization()
        //locationManager.startMonitoringSignificantLocationChanges()

    //MARK: - CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var location : CLLocation = locations [locations.count-1] as CLLocation
        if (location.horizontalAccuracy > 0){
            self.locationManager.stopUpdatingLocation()
            println(location.coordinate)
            locationInfo . longitude = toString(location.coordinate.longitude)
            locationInfo . latitude = toString(location.coordinate.latitude)
            locationInfo . status = true
            println(self.locationInfo.status)
        }
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case CLAuthorizationStatus.NotDetermined :
            if ( self.locationManager .respondsToSelector("requestAlwaysAuthorization")) {
                self.locationManager.requestAlwaysAuthorization()
                locationManager.delegate = self
                locationManager.distanceFilter = 200
                locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
                locationManager.startUpdatingLocation()
                println("didChangeAuthorizationStatus: \(status)")
            }
        default: break
        }
    }

}