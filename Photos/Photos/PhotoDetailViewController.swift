//
//  PhotoDetailViewController.swift
//  Photos
//
//  Created by Andrea Liu on 4/10/16.
//  Copyright © 2016 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo: Photo!
    var likesLabel:UILabel!
    var dateLabel:UILabel!
    var usernameLabel:UILabel!
    var heartButton:UIButton!
    var standardResURL: String!
    var imageView:UIImageView!
    
    
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let screenSize = UIScreen.mainScreen().bounds.size
        
        let bgFrame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        let bgView = UIView(frame:bgFrame)
        //let bgColor = UIColor(red: 213, green: 218, blue: 219, alpha: 1.0)
        bgView.backgroundColor = UIColor(red: 240/255, green: 236/255, blue: 235/255, alpha: 1)
        view.addSubview(bgView)
        
        let bgColorFrame = CGRect(x: 50, y: 100, width: 330, height: screenSize.height/1.3)
        let bgView2 = UIView(frame:bgColorFrame)
        bgView2.backgroundColor = UIColor.whiteColor()
        bgView2.layer.cornerRadius = 15.0
        bgView2.layer.masksToBounds = true
        view.addSubview(bgView2)
        
        let imageFrame = CGRect(x: 75, y: 160, width: screenSize.width/1.5, height: screenSize.height/3)
        imageView = UIImageView(frame: imageFrame)
        let loadedURL:NSURL = NSURL(string: standardResURL)!
        imageView.image = UIImage(data: NSData(contentsOfURL: loadedURL)!)
        imageView.contentMode = UIViewContentMode.ScaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGrayColor().CGColor
        imageView.layer.masksToBounds = true
        view.addSubview(imageView)
        
        let usernameFrame = CGRect(x:10, y: 119, width: screenSize.width, height: 20)
        usernameLabel = UILabel(frame: usernameFrame)
        usernameLabel.textColor = UIColor.blackColor()
        usernameLabel.font = UIFont.boldSystemFontOfSize(20.0)
        usernameLabel.text = photo.username
        usernameLabel.textAlignment = .Center
        view.addSubview(usernameLabel)
        
        let dateFrame = CGRect(x:75, y: 185 + screenSize.height/3, width: imageFrame.width, height: 20)
        dateLabel = UILabel(frame:dateFrame)
        let dateFormat = NSDateFormatter()
        dateFormat.dateStyle = NSDateFormatterStyle.ShortStyle
        dateLabel.textAlignment = .Center
        dateLabel.textColor = UIColor.whiteColor()
        dateLabel.layer.backgroundColor = UIColor.blackColor().CGColor
        dateLabel.text = dateFormat.stringFromDate(photo.date)
        self.view.addSubview(dateLabel)
        
        let likesFrame = CGRect(x:74.5, y: 205 + screenSize.height/3, width: imageFrame.width, height: 25)
        likesLabel = UILabel(frame: likesFrame)
        likesLabel.textColor = UIColor.blackColor()
        likesLabel.text = "Likes: " + String(photo.likes)
        likesLabel.textAlignment = .Center
        likesLabel.layer.borderWidth = 1.5
        likesLabel.layer.borderColor = UIColor.blackColor().CGColor
        view.addSubview(likesLabel)
        
        let heartFrame = CGRect(x:5, y: 260 + screenSize.height/3, width: screenSize.width, height: 100)
        heartButton = UIButton(type: UIButtonType.System) as UIButton
        heartButton.frame = heartFrame
        heartButton.setTitle("♡", forState: UIControlState.Normal)
        heartButton.setTitle("♥", forState: UIControlState.Disabled)
        let heartColor = UIColor(red: 158/255, green: 65/255, blue: 65/255, alpha: 1.0)
        heartButton.tintColor = heartColor
        heartButton.setTitleColor(heartColor, forState: .Normal)
        heartButton.titleLabel!.font = UIFont.boldSystemFontOfSize(90.0)
        heartButton.titleLabel!.textColor = UIColor.blackColor()
        heartButton.addTarget(self, action: "pressHeartButton:", forControlEvents: UIControlEvents.TouchUpInside)
        if (photo.liked == true) {
            heartButton.enabled = false
        }
        view.addSubview(heartButton)
    }
    
    func pressHeartButton(sender: UIButton) {
        photo.likes = photo.likes + 1
        likesLabel.text = "Likes: " + String(photo.likes)
        photo.liked = true
        heartButton.enabled = false
    }

    
    
    init(photograph: Photo) {
        super.init(nibName: nil, bundle: nil)
        self.photo = photograph
        self.standardResURL = photo.url
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
