//
//  ViewController.swift
//  BadDrawing
//
//  Created by Yihe Li on 1/21/15.
//  Copyright (c) 2015 self. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBOutlet weak var colorPickerView: UIImageView!
    @IBOutlet var drawView: DrawView!
    
    @IBAction func colorTapped (sender: UIButton!) {
        var color : UIColor
        if sender.titleLabel!.text == "red" {
            color = UIColor.redColor()
        } else if sender.titleLabel!.text == "black" {
            color = UIColor.blackColor()
        } else {
            color = UIColor.blueColor()
        }
        drawView.drawColor = color
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorPickerView.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: "handleTap:")
        let pan = UIPanGestureRecognizer(target: self, action: "handlePan:")
        colorPickerView.addGestureRecognizer(tap)
        colorPickerView.addGestureRecognizer(pan)
    }
    
    func handleTap(tap : UITapGestureRecognizer) {
        print("tap")
        let location = tap.locationInView(colorPickerView)
        drawView.drawColor = UIColor(hue: 1 - location.x / self.view.frame.size.width, saturation: 1, brightness: 1, alpha: 1)
    }
    
    func handlePan(pan : UIPanGestureRecognizer) {
        print("Pan")
        if pan.state == .Ended {
            let location = pan.locationInView(colorPickerView)
            drawView.drawColor = UIColor(hue: 1 - location.x / self.view.frame.size.width, saturation: 1, brightness: 1, alpha: 1)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearTapped() {
        drawView.lines = [Line]()
        drawView.setNeedsDisplay()
    }
}

