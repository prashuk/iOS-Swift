//
//  ViewController.swift
//  GCDSample
//
//  Created by Prashuk Ajmera on 11/1/19.
//  Copyright © 2019 Prashuk Ajmera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        simpleQueues()
        
//        queuesWithQoS()
        
//         concurrentQueues()
//         if let queue = inactiveQueue {
//            queue.activate()
//         }
         
//        queueWithDelay()
        
//        fetchImage()
        
        // useWorkItem()
    }
    
    
    func simpleQueues() {
        let queue = DispatchQueue(label: "com.prashuk.myqueue")
        queue.sync {
            for i in 50..<60 {
                print("*", i)
            }
        }
        queue.async {
            for i in 0..<10 {
                print("@", i)
            }
        }
        for i in 100..<110 {
            print("#", i)
        }
    }
    
    
    func queuesWithQoS() {
        let queue1 = DispatchQueue(label: "com.prashuk.q1", qos: .userInitiated)
        let queue2 = DispatchQueue(label: "com.prashuk.q2", qos: .utility)
        queue1.async {
            for i in 50..<60 {
                print("*", i)
            }
        }
        queue2.async {
            for i in 0..<10 {
                print("@", i)
            }
        }
        for i in 100..<110 {
            print("#", i)
        }
    }
    
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueues() {
        let anotherQueue = DispatchQueue(label: "com.prashuk.anotherQueue", qos: .utility, attributes: .initiallyInactive)
        inactiveQueue = anotherQueue
        
        anotherQueue.async {
            for i in 50..<60 {
                print("*", i)
            }
        }
        anotherQueue.async {
            for i in 0..<10 {
                print("@", i)
            }
        }
        anotherQueue.async {
            for i in 100..<110 {
                print("#", i)
            }
        }
    }
    
    
    func queueWithDelay() {
        let delayQueue = DispatchQueue(label: "com.prashuk.delayqueue", qos: .userInitiated)
        print(Date())
        let additionalTime: DispatchTimeInterval = .seconds(2)
        delayQueue.asyncAfter(deadline: .now() + additionalTime) {
            print(Date())
        }
    }
    
    
    func fetchImage() {
        let imageURL: URL = URL(string: "https://www.appcoda.com/wp-content/uploads/2015/12/blog-logo-dark-400.png")!
        
           (URLSession(configuration: URLSessionConfiguration.default)).dataTask(with: imageURL, completionHandler: { (imageData, response, error) in
        
               if let data = imageData {
                   print("Did download image data")
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
                   
               }
           }).resume()
    }
    
    
    func useWorkItem() {
        
    }


}

