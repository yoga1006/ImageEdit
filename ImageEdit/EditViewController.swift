//
//  EditViewController.swift
//  ImageEdit
//
//  Created by Yoga on 2022/8/18.
//

import UIKit

class EditViewController: UIViewController, UIColorPickerViewControllerDelegate {
    
    
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var turnleftButton: UIButton!
    @IBOutlet weak var turnrightButton: UIButton!
    @IBOutlet weak var mirrorButton: UIButton!
    
    @IBOutlet weak var zoominSlider: UISlider!
    
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
        zoominSlider.isHidden = true
        
        
        //設定原始顯示圖片比例為1:1
        containerView.bounds.size = CGSize(width: 350, height: 350)
        picImageView.frame = containerView.bounds
        
    }
    
    
    @IBAction func rotate(_ sender: UIButton) {
        turnleftButton.isHidden = false
        turnrightButton.isHidden = false
        mirrorButton.isHidden = false
    }
    
    //改變照片方向向左轉
    @IBAction func leftRotate(_ sender: UIButton) {
        turnleftTimes += 1
        let oneDegree = CGFloat.pi / 180
        picImageView.transform = CGAffineTransform(rotationAngle: (oneDegree * -90)*CGFloat(turnleftTimes))
    }
    
    //改變照片方向向右轉
    @IBAction func rightRotate(_ sender: UIButton) {
        
        turnrightTimes += 1
        let oneDegree = CGFloat.pi / 180
        picImageView.transform = CGAffineTransform(rotationAngle: (oneDegree * 90)*CGFloat(turnrightTimes))
    }
    
    //改變照片方向鏡向轉
    @IBAction func mirrorRotate(_ sender: UIButton) {
        mirrorTimes *= -1
        picImageView.transform = CGAffineTransform(scaleX: CGFloat(mirrorTimes), y: 1)
    }
    
    //改變照片比例跟大小
    @IBAction func changeScale(_ sender: UIButton) {
        sizeSegmentedControl.isHidden = false
        zoominSlider.isHidden = false
        
    }
    
    //改變照片比例
    @IBAction func changeScaleDetail(_ sender: Any) {
        let length: Int = 350
        var width: Int
        var height: Int
        
        //設定原始顯示圖片比例為1:1
        switch sizeSegmentedControl.selectedSegmentIndex {
        case 0: //1:1
            width = length
            height = length
        case 1: //4:3
            width = length
            height = Int(Double(length) / 4 * 3)
        case 2: //16:9
            width = length
            height = Int(Double(length) / 16 * 9)
        default: //1:1
            width = length
            height = length
           
        }
        picImageView.bounds.size = CGSize(width: width, height: height)
    }
    
    
    @IBAction func zoominout(_ sender: Any) {
        picImageView.transform = CGAffineTransform(scaleX: CGFloat(zoominSlider.value), y: CGFloat(zoominSlider.value))
    }
    
    
    
    //改變背景顏色
    @IBAction func changeColor(_ sender: Any) {
     
        let controller = UIColorPickerViewController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
        
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        
        containerView.backgroundColor = color
        dismiss(animated: true, completion: nil)
    }
    
    //儲存照片
    @IBAction func saveEditedPhoto(_ sender: Any) {
        //利用UIGraphicsImageRenderer將view變成UIImage
        let renderer = UIGraphicsImageRenderer(size: containerView.bounds.size)
        //呼叫image(actions:)產生圖片
        let editimage = renderer.image(actions: { context in
             containerView.drawHierarchy(in: containerView.bounds, afterScreenUpdates: true)
          })
        //利用UIActivityViewController分享圖片
        let activityViewController = UIActivityViewController(activityItems: [editimage], applicationActivities: nil)
          present(activityViewController, animated: true, completion: nil)
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
