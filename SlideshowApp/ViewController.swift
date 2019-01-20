//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Yoshiki Izumi on 2019/01/20.
//  Copyright © 2019 Yoshiki Izumi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer: Timer!
    var imageNumber: Int = 0
    var images: [UIImage]! = [UIImage(named: "author")!, UIImage(named: "bg")!, UIImage(named: "face")!]
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = images[imageNumber]
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = imageView.image
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    func nextImage() {
        imageNumber += 1
        if imageNumber >= images.count {
            imageNumber = 0
        }
        imageView.image = images[imageNumber]
    }
    @IBAction func nextButton(_ sender: Any) {
        nextImage()
    }
    @IBAction func backButton(_ sender: Any) {
        imageNumber -= 1
        if imageNumber < 0 {
            imageNumber = images.count - 1
        }
        imageView.image = images[imageNumber]
    }
    @IBAction func playAndStopButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (Timer) in
                self.nextImage()
            })
        } else {
            timer.invalidate()
            timer = nil
        }
    }
}

