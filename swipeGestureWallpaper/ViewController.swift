//
//  ViewController.swift
//  swipeGestureWallpaper
//
//  Created by WuKwok Ho on 24/3/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let images:[String] = ["image1", "image2", "image3", "image4", "image5", "image6", "image7"]
    
    let maxImage: Int = 6
    var imageIndex: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwiped(_:)))
        rightSwipe.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.imageSwiped(_:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftSwipe)
        
        imageView.image = UIImage(named: "image1")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imageSwiped(gesture:UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                imageIndex = imageIndex - 1
                
                if imageIndex < 0 {
                    imageIndex = maxImage
                }
                
                imageView.image = UIImage(named: images[imageIndex])
                
            case UISwipeGestureRecognizerDirection.Left:
                imageIndex = imageIndex + 1
                
                if imageIndex > maxImage {
                    imageIndex = 0
                }
                
                swipeAction(imageIndex)
            
            default:
                break
            }
        }
    }
    
    ///////////////////////////////////////    
    //////////////Questions ///////////////
    ///////////////////////////////////////
    
    
    @IBAction func upSwipe(sender: AnyObject) {
        let currentShow = imageIndex + 1 < images.count ? imageIndex + 1:0
        swipeAction(currentShow)
        print("upswipe")
        
        
    }
    
    
    @IBAction func downSwipe(sender: AnyObject) {
        let currentShow = imageIndex - 1 >= 0 ? imageIndex - 1: images.indexOf(images.last!)
        swipeAction(currentShow!)
    }
    
    func swipeAction(index: Int) {
    imageView.image = UIImage(named: images[imageIndex])
    }
}

