//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    var date: NSDate!
    var liked:Bool!
    var thumbnailURL: String!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        likes = (data.valueForKey("likes") as! NSDictionary).valueForKey("count") as! Int
        url = ((data.valueForKey("images") as! NSDictionary).valueForKey("standard_resolution") as! NSDictionary).valueForKey("url") as! String
        username = (data.valueForKey("user") as! NSDictionary).valueForKey("username") as!String
        thumbnailURL = ((data.valueForKey("images") as! NSDictionary).valueForKey("thumbnail") as! NSDictionary).valueForKey("url") as! String
        liked = false
        date = NSDate(timeIntervalSince1970: Double(data.valueForKey("created_time") as! String)!)
    }

}