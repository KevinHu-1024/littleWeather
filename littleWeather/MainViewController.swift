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
            weatherCell.setBackgroundColorBy(weatherService.weatherInfoNow.weather)
            weatherCell.city?.text = weatherService.weatherInfoNow.city
            weatherCell.temp?.text = weatherService.weatherInfoNow.temp
            weatherCell.weather?.text = weatherService.weatherInfoNow.weather
            weatherCell.day?.text = weatherService.weatherInfoNow.day
            return weatherCell
            
        case 1:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
            weatherCell.setBackgroundColorBy(weatherService.weatherInfo.weather)
            weatherCell.city?.text = weatherService.weatherInfo.city
            weatherCell.temp?.text = weatherService.weatherInfo.temp
            weatherCell.weather?.text = weatherService.weatherInfo.weather
            weatherCell.day?.text = weatherService.weatherInfo.day
            return weatherCell
            
        case 2:
            var weatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
            weatherCell.setBackgroundColorBy(weatherService.weatherInfo2.weather)
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
        
        var rect_screen = UIScreen.mainScreen().bounds.size
//        println("rect_screen = \(rect_screen.height)")
        var cellHeight = (rect_screen.height - 58)/3
//        println("cellHeight = \(cellHeight)")
        
        return cellHeight
        
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
