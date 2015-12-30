//
//  footerview.swift
//  myfresh
//
//  Created by  yanglc on 15/12/30.
//  Copyright © 2015年  yanglc. All rights reserved.
//

import UIKit


protocol PTLoadMore{
    
    func loadMore();
    
    
}


class Footerview: UIView {
    
    
    
    
    var dell:PTLoadMore?;
    
    
    
    
    
    class func createFooterView()->Footerview{

        var ttt = NSBundle.mainBundle().loadNibNamed("footer", owner: nil, options: nil).last as! Footerview

        
        
        
        return ttt;
        
    }
    
    
    @IBOutlet weak var btmore: UIButton!
    
    @IBAction func getmore(sender: AnyObject) {
        
        
        btmore.setTitle("正在加载更多", forState:.Normal)
        
        if(dell != nil){
            dell?.loadMore();
        }
        
        reset();
    }
    
    func reset(){
        
        btmore.setTitle("点击加载更多", forState: .Normal)
        
        
    }
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
