//
//  StartViewController.swift
//  ImageEdit
//
//  Created by Yoga on 2022/8/18.
//

import UIKit

class StartViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pictureImgeView: UIImageView!
    @IBOutlet weak var editImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addPhoto(_ sender: Any) {
       
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true)
        pictureImgeView.isHidden = true
        editImageView.isHidden = true
        
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBSegueAction func editPic(_ coder: NSCoder) -> EditViewController? {
        
        let controller = EditViewController(coder: coder)
        controller?.enterPic = imageView
        return controller
    }
    
    

}
