//
//  EditViewController.swift
//  ImageEdit
//
//  Created by Yoga on 2022/8/18.
//

import UIKit

class EditViewController: UIViewController {
    
    
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var turnleftButton: UIButton!
    @IBOutlet weak var turnrightButton: UIButton!
    @IBOutlet weak var mirrorButton: UIButton!
    
    var turnleftTimes = 0
    var turnrightTimes = 0
    var mirrorTimes = 1

    
    @IBOutlet weak var picImageView: UIImageView!
    var enterPic:UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picImageView.image = enterPic.image
        turnleftButton.isHidden = true
        turnrightButton.isHidden = true
        mirrorButton.isHidden = true
        sizeSegmentedControl.isHidden = true
        
        
        //設定原始顯示圖片比例為1:1
        containerView.bounds.size = CGSize(width: 350, height: 350)
        
    }
    
    
    @IBAction func rotate(_ sender: UIButton) {
        turnleftButton.isHidden = false
        turnrightButton.isHidden = false
        mirrorButton.isHidden = false
    }
    
    
    @IBAction func leftRotate(_ sender: UIButton) {
        turnleftTimes += 1
        let oneDegree = CGFloat.pi / 180
        picImageView.transform = CGAffineTransform(rotationAngle: (oneDegree * -90)*CGFloat(turnleftTimes))
    }
    
    
    @IBAction func rightRotate(_ sender: UIButton) {
        
        turnrightTimes += 1
        let oneDegree = CGFloat.pi / 180
        picImageView.transform = CGAffineTransform(rotationAngle: (oneDegree * 90)*CGFloat(turnrightTimes))
    }
    
    
    @IBAction func mirrorRotate(_ sender: UIButton) {
        mirrorTimes *= -1
        picImageView.transform = CGAffineTransform(scaleX: CGFloat(mirrorTimes), y: 1)
    }
    
    
    @IBAction func changeScale(_ sender: UIButton) {
        sizeSegmentedControl.isHidden = false
        let length: Int = 350
        var width: Int
        var height: Int
        
        //設定原始顯示圖片比例為1:1
        switch sizeSegmentedControl.selectedSegmentIndex {
        case 0: //1:1
            width = length
            height = length
        case 1: //3:4
            width = length
            height = Int(Double(length) / 3 * 4)
        case 2: //4:3
            width = length
            height = Int(Double(length) / 4 * 3)
        case 3: //16:9
            width = length
            height = Int(Double(length) / 16 * 9)
        default: //1:1
            width = length
            height = length
          
        }
        
       containerView.bounds.size = CGSize(width: width, height: height)
    }
    
  
    @IBAction func changeColor(_ sender: Any) {
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
