//
//  MainViewController.swift
//  littleWeather
//
//  Created by Mac on 15/4/6.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

import UIKit

let weatherService = WeatherService()

class MainViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置两个允许
        
        //设置对应的位置服务
        
        //设置对应的天气服务
        
        //刷新
        
        //test
//        let locationService = LocationService()
//        println(locationService.locationInfo.latitude)
        weatherService.test()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "update", name: "locationInfoUpdated", object: nil)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(NSNotification){
        
//                weatherService.test()
        println("Noti!")

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
        return 2
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let WeatherCell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as MainTableViewCell
        
        return WeatherCell

    }
    
    func tableView( tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 230
        
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
