//
//  MainViewController.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import UIKit


class MainViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tbv: UITableView?
    let weatherService = WeatherService()

    override func viewDidLoad() {
        super.viewDidLoad()
       weatherService.locationService.on()
    }
    
    override func  viewWillAppear(animated: Bool) {
        weatherService.locationService.on()
        println("viewWillAppear")
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update:", name: "locationInfoUpdated", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update2:", name: "infoUpdated", object: nil)
        tbv?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func update(NSNotification){
        weatherService.test()
        println("returnToMain!")
    }
    
    func update2(NSNotification){
        println("infoUpdated!")
        tbv?.reloadData()
    }

    
    @IBAction func refreash(){
        weatherService.locationService.on()
        println("F5")
        tbv?.reloadData()
    }
    
    func setCellColorBy(weather:String) ->UIColor{
        //对String提取最后一个字
        //对最后一个字进行swich，每种状况设置一个颜色，然后break，外面返回cellColor
        var cellColor = UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
//        println("weather = \(weather), endIndexIs = \(weather[weather.endIndex.predecessor()])")
        if weather.isEmpty {
            println("cellIsEmpty")
        }else{
        switch weather[weather.endIndex.predecessor()] {
        case "晴":
            cellColor = UIColor(red: 1, green: 200/255, blue: 180/255, alpha: 1)
        case "云":
                cellColor = UIColor(red: 60/255, green: 100/255, blue: 100/255, alpha: 1)
        case "霾":
                cellColor = UIColor(red: 30/255, green: 200/255, blue: 180/255, alpha: 1)
        case "雨":
            cellColor = UIColor(red: 0, green: 215/255, blue: 255/255, alpha: 1)
        default:
            cellColor = UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
        }
        }
        return cellColor
    }
    

    // MARK: - TableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
//            weatherCell.backgroundColor = UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
            weatherCell.backgroundColor = setCellColorBy(weatherService.weatherInfoNow.weather)
            weatherCell.city?.text = weatherService.weatherInfoNow.city
            weatherCell.temp?.text = weatherService.weatherInfoNow.temp
            weatherCell.weather?.text = weatherService.weatherInfoNow.weather
            weatherCell.day?.text = weatherService.weatherInfoNow.day
            return weatherCell
            
        case 1:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
//            weatherCell.backgroundColor = UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
            weatherCell.backgroundColor = setCellColorBy(weatherService.weatherInfo.weather)
            weatherCell.city?.text = weatherService.weatherInfo.city
            weatherCell.temp?.text = weatherService.weatherInfo.temp
            weatherCell.weather?.text = weatherService.weatherInfo.weather
            weatherCell.day?.text = weatherService.weatherInfo.day
            return weatherCell
            
        case 2:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
//            weatherCell.backgroundColor = UIColor(red: 20/255, green: 200/255, blue: 180/255, alpha: 1)
            weatherCell.backgroundColor = setCellColorBy(weatherService.weatherInfo2.weather)
            weatherCell.city?.text = weatherService.weatherInfo2.city
            weatherCell.temp?.text = weatherService.weatherInfo2.temp
            weatherCell.weather?.text = weatherService.weatherInfo2.weather
            weatherCell.day?.text = weatherService.weatherInfo2.day
            return weatherCell

        default:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
            weatherCell.city?.text = "noData"
            weatherCell.temp?.text = "noData"
            weatherCell.weather?.text = "noData"
            weatherService.test()
            return weatherCell
        }


    }
    
    func tableView( tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 170
        
    }

    
    
    //
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
