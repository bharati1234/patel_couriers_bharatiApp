//
//  ImagePicker.swift
//  wardrobe
//
//  Created by Swapnil Dhavan on 24/07/19.
//  Copyright © 2019 Swapnil Dhavan. All rights reserved.
//

import Foundation
import UIKit

class ImagePicker: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    static let shared = ImagePicker()
    var imageView = UIImageView()
    var completion: ((Bool) -> ())?
   
    
    func PickImage(viewContoller: UIViewController, imageView: UIImageView,completion: @escaping (Bool) -> ()){
        self.imageView = imageView
        self.completion = completion
        let alert = UIAlertController(title: "Add Profile Picture", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Take photo", style: .default, handler: { action in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.camera
            image.allowsEditing = false
            viewContoller.present(image,animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { action in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerController.SourceType.photoLibrary
            image.allowsEditing = false
            viewContoller.present(image,animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
        }))
        viewContoller.present(alert, animated: true, completion: nil)
    }
    
    func ImageChooseFromLib(viewContoller: UIViewController, imageView: UIImageView,completion: @escaping (Bool) -> ()){
        self.imageView = imageView
        self.completion = completion
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = false
        viewContoller.present(image,animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImage: UIImage?
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        selectedImage = resizeImage(image: selectedImage! , newWidth: 1000)
        
        //selectedImage = UIImage(data: selectedImage!.jpegData(compressionQuality: 0)!)
        //let imgData: NSData = NSData(data: (selectedImage!.jpegData(compressionQuality: 0))!)
        //let imgData: NSData = NSData(data: UIImageJPEGRepresentation((selectedImage!), 0)!)
        //let imageSize: Int = imgData.length
        //print("size of image in KB: %f ", Double(imageSize) / 1024.0)
        
        imageView.image = selectedImage!
        completion!(true)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth,height: newHeight))
        image.draw(in: CGRect(x: 0,y: 0, width: newWidth,height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
}
