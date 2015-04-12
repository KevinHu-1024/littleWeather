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

//WeatherService 接收来自LocationService 的经纬度信息，经由网络服务获得天气信息，解析并存入一个结构体

struct WeatherInfo {
    var city: String
    var cityID: String
    var  weather: String
    var temp: String
}


class WeatherService: NSObject {
    
    let locationService = LocationService()
    

    let ak = "rnvGvlrTOvCO8Sbcvj4UGa66"
    let mcode = "com.example.littleWeather"
    
    // MARK: - 测试传值
    func test (){
        locationService.on()
        if (locationService.locationInfo.status) {
            var urlA = "http://api.map.baidu.com/telematics/v3/weather?location=\(locationService.locationInfo.longitude),\(locationService.locationInfo.latitude)&output=json&ak=\(ak)&mcode=\(mcode)"
            println("url = \(urlA)")
            locationService.locationInfo.status = false
   // MARK: - 网络请求
            Alamofire.request(.GET, urlA)
                .responseJSON { (_, _, JSON, _) in
                    println(JSON!)
            }
    // MARK: -解析JSON
            
            
            
        }else{
            println("Waiting...")
        }
    }
}
