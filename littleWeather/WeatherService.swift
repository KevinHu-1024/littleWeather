//
//  WeatherService.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//WeatherService 接收来自LocationService 的经纬度信息，经由网络服务获得天气信息，解析并存入一个结构体

struct WeatherInfo {
//    var source: JSON?
    var city: String
//    var cityID: String
    var  weather: String
    var temp: String
    init(){
        city = "none"
//        cityID = "none"
        weather = ""
        temp = ""
    }
}


class WeatherService: NSObject {
    
    let locationService = LocationService()

    let ak = "rnvGvlrTOvCO8Sbcvj4UGa66"
    let mcode = "com.example.littleWeather"
    
    var weatherInfo = WeatherInfo()
    
    // MARK: - 测试传值
    func test (){
        locationService.on()
        if (locationService.locationInfo.status) {
            var urlA = "http://api.map.baidu.com/telematics/v3/weather?location=\(locationService.locationInfo.longitude),\(locationService.locationInfo.latitude)&output=json&ak=\(ak)&mcode=\(mcode)"
            println("url = \(urlA)")
            locationService.locationInfo.status = false
            Alamofire.request(.GET, urlA)
                .responseJSON { (_, _, getJSON, _) in
                    if ((getJSON) != nil){
//                        println(getJSON!)
                        var json = JSON(getJSON!)
                        self.weatherInfo.city = json["results"][0]["currentCity"].stringValue
//                        self.weatherInfo.weather = json["results"][0]["currentCity"].stringValue
                        self.weatherInfo.temp = json["results"][0]["weather_data"][1]["temperature"].stringValue
//                        println(json["results"][0]["weather_data"][1])
                        println(self.weatherInfo.temp)
                    }else{
                        println("No Json Data!")
                    }
            }
            println("date = \(weatherInfo.city)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        }else{
            println("Waiting...")
        }
    }
    
}
