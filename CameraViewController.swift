//
//  CameraViewController.swift
//  Camera
//
//  Created by Matt Larkin on 4/7/15.
//  Copyright (c) 2015 Matt Larkin. All rights reserved.
//

import UIKit
import MobileCoreServices
import CoreImage
import filterViewController
import Parse

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

//var imagePicker: UIImagePickerController!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var OverlayView: UIView!
    let imagePicker = UIImagePickerController()



    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

    }

    
    /**
    Allows user to connect to photo library

    :param: sender button
    */

    @IBAction func photoLibrary(sender: UIBarButtonItem) {
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    /**
    Controls Camera and Photo Functions

    :param: imagePicker imagePicker
    :param: info        controls photo functionality
    */
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    var chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
    imageView.contentMode = .ScaleAspectFit
    imageView.image = chosenImage
    UIImageWriteToSavedPhotosAlbum(chosenImage, nil, nil, nil)
    self.savedImageAlert()
    //Upload image to Parse
    let imageData = UIImagePNGRepresentation(scaledImage)
    let imageFile: PFFile = PFFile(data: imageData)
    var userPhoto = PFObject(className: "postString")
        userPhoto["imageFile"] = imageFile
        userPhoto.saveInBackground()

    dismissViewControllerAnimated(true, completion: nil)
    }

    /**
    Cancel Photo Library

    :param: picker imagePicker
    */
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /**
    Calls the camera function to take picture

    :param: sender UIImagePicker
    */
    @IBAction func takePhoto(sender: AnyObject) {

        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            var picker = UIImagePickerController()
            imagePicker.sourceType = .Camera
            presentViewController(imagePicker, animated: true, completion: nil)
        }
        else{
            NSLog("No Camera Detected.")
        }
    }


    /**
    Alerts users that picture was saved to photo library
    */
    func savedImageAlert()
    {
        var alert:UIAlertView = UIAlertView()
        alert.title = "Saved!"
        alert.message = "Your picture was saved to Camera Roll"
        alert.delegate = self
        alert.addButtonWithTitle("Ok")
        alert.show()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var CameraViewcontroller:CameraViewController = segue.destinationViewController as filterViewController

        imageView.image = image
        NSLog("iamge %@", imageEditcontroller.editImage)
    }


        }
   


