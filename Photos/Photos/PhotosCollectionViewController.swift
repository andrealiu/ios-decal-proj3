//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.backgroundColor = UIColor(red: 240/255, green: 236/255, blue: 235/255, alpha: 1)
        collectionView!.registerClass(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "customCell")
        
        self.view.addSubview(collectionView!)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let images = photos {
            return images.count
        }
        return 0
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("customCell", forIndexPath: indexPath) as! CustomCollectionViewCell
        if let photographs = photos {
            let photo = photographs[indexPath.item]
            loadImageForCell(photo, imageView: cell.photoImage)
            cell.usernameLabel?.text = String(photo.username)
        }
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedPhoto : Photo! = photos[indexPath.item]
        showPhotoDetail(selectedPhoto)
    }
    
    func showPhotoDetail(photo: Photo) {
        let photoDetailViewController : PhotoDetailViewController = PhotoDetailViewController(photograph: photo)
        self.navigationController?.pushViewController(photoDetailViewController, animated: true)
    }

    /*
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let photoURL:NSURL = NSURL(string: photo.thumbnailURL)!
        let photoData:NSData = NSData(contentsOfURL: photoURL)!
        imageView.image = UIImage(data:photoData)
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

