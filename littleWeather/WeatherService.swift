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
    init(){
        city = "none"
        cityID = "none"
        weather = ""
        temp = ""
    }
}


class WeatherService: NSObject {
    
    let locationService = LocationService()
    

    let ak = "rnvGvlrTOvCO8Sbcvj4UGa66"
    let mcode = "com.example.littleWeather"
    
    var weatherInfo = WeatherInfo()
//    var json:
//    var buffer = [ String:String]()
    
    // MARK: - 测试传值
    func test (){
        locationService.on()
        if (locationService.locationInfo.status) {
            var urlA = "http://api.map.baidu.com/telematics/v3/weather?location=\(locationService.locationInfo.longitude),\(locationService.locationInfo.latitude)&output=json&ak=\(ak)&mcode=\(mcode)"
            println("url = \(urlA)")
            locationService.locationInfo.status = false
   // MARK: - 网络请求
            Alamofire.request(.GET, urlA)
                .responseJSON { (_, _, getJSON, _) in
                    println(getJSON!)
//                    var json = JSON( getJSON! )
//                    self.weatherInfo.city = json["error"].stringValue
                    self.updatejson(getJSON as NSDictionary!)
            }
    // MARK: -解析JSON
            println(weatherInfo.city)
            
        }else{
            println("Waiting...")
        }
    }
    
    func updatejson (jsonResult: NSDictionary!){
        
        if let city = jsonResult ["date"]? as? String{
            weatherInfo.city = city
        }else{
            weatherInfo.city = "unknown"
        }
        println(weatherInfo.city)
//        if let weather = jsonResult ["weatherinfo"]?["weather2"]? as? String{
//            todayWeather.text = weather
//        }else{
//            todayWeather.text = "unknown"
//        }
//        if let city = jsonResult ["weatherinfo"]?["city"]? as? String{
//            cityName.text = city
//        }else{
//            cityName.text = "unknown"
//        }
        
    }
}
