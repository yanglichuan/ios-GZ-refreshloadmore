//
//  ViewController.swift
//  myfresh
//
//  Created by  yanglc on 15/12/30.
//  Copyright © 2015年  yanglc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,PTLoadMore {

    @IBOutlet weak var tableview: UITableView!
    
    var freshControl:UIRefreshControl!
    
    
    
    
    var mydata:NSMutableArray = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        mydata = NSMutableArray();
        for a in 1...50{
            mydata.addObject("item" + String(a));
            
        }
        
        
        
        
        freshControl = UIRefreshControl();
        freshControl.addTarget(self, action: "freshsh:", forControlEvents: .ValueChanged)
        
        freshControl.tintColor = UIColor.greenColor()
        freshControl.backgroundColor = UIColor.yellowColor()
        
        
        tableview.addSubview(freshControl)
        
        
        var footerview = Footerview.createFooterView();
      
        footerview.backgroundColor = UIColor.greenColor()
        footerview.frame = CGRect(x: 0, y: 0, width: tableview.frame.size.width, height: 50);
        footerview.dell = self;
        
        
        
        tableview.tableFooterView = footerview;
        
        
        
        
        tableview.delegate = self;
        tableview.dataSource  = self;
        
        freshControl.refreshing;
    }
    
    
    func loadMore() {
        
        for b in 1...5{
            
            mydata.addObject("new item")
        }
        
 
        tableview.reloadData()
        
        
        
        
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mydata.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var cell = tableview.dequeueReusableCellWithIdentifier("bbb")
        
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: "bbb")
            
            cell?.backgroundColor = UIColor.redColor()
        
            
        }
        
        
        var itemdata = mydata[indexPath.row] as? String
        if(itemdata != nil){
            cell?.textLabel?.text = itemdata;
        }
        
        
        return cell!
        
    }
    
    
    
    
    //刷新函数

    func freshsh(ss:UIRefreshControl){

        
        performSelector("bbb", withObject: nil, afterDelay: 2);
     }
    
    func bbb(){
        
        mydata.addObject("newItem")

        
        tableview.reloadData()
        
        
        freshControl.endRefreshing();
        
        
    }






    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

