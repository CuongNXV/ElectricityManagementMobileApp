//
//  UseLibrary.swift
//  MobileAppML
//
//  Created by Nguyen Cuong on 7/8/20.
//  Copyright © 2020 Nguyen Cuong. All rights reserved.
//

import UIKit
import Alamofire
import Then
import Reusable
import SVProgressHUD
import Firebase

class UseLibrary: UIViewController {
    @IBOutlet weak var imageElecticMeter: UIImageView!
    @IBOutlet weak var numberRoom: UITextField!
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var number5: UITextField!
    
    private var encode = ""
    private var isSuccess = false
    private var isConnect = false
    private var dataMeter: DetectMeter?
    private var imageTmp: UIImage?
    private var numberElectric = ""
    private let indicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.color = UIColor.red
        view.addSubview(indicator)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buttonBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func chooseImage(_ sender: Any) {
        showImagePicker()
        
    }
    
    @IBAction func sendImage(_ sender: Any) {
        showLoading()
        sendInfoElectricMeter()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func showLoading() {
        indicator.center = self.view.center
        indicator.hidesWhenStopped = true
        indicator.color = UIColor.white
        indicator.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
        indicator.frame = view.frame
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func disappearLoading() {
        indicator.stopAnimating()
    }
    
    func sendInfoElectricMeter() {
        //SVProgressHUD.show(withStatus: "Loading...")
        let room = numberRoom.text ?? ""
        let num1 = number1.text ?? ""
        let num2 = number2.text ?? ""
        let num3 = number3.text ?? ""
        let num4 = number4.text ?? ""
        let num5 = number5.text ?? ""
        if (room.count > 0 && num1.count > 0 &&
            num2.count > 0 && num3.count > 0 &&
            num4.count > 0 && num5.count > 0) {
            
            let num = num1 + num2 + num3 + num4 + num5
            let numRoom = Int(numberRoom.text!)
            let param: Parameters = [
                "img_link":Constant.linkImage,
                "digit_value":num,
                "room_number":numRoom ?? 0
            ]
            var isSend = false
            var isConnected = false
            print("Room: " + numberRoom.text! + "---" + "Number " + num)
            UploadImage.shared.send(param, Constant.token) { [unowned self] in
                isSend = $0
                isConnected = $1
                if isConnected {
                    if isSend {
                        self.disappearLoading()
                        print("Success Send Infor Room")
                    } else {
                        self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                         message: NSLocalizedString(Constant.Alert.alertUploadFail, comment: ""))
                    }
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.internetError, comment: ""))
                }
            }
        } else {
            self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
            message: NSLocalizedString(Constant.Alert.alertSendFail, comment: ""))
        }
    }
    
    func detectNumber() {
//        print(Constant.linkImage)
        let param: Parameters = [
            "img_link":Constant.linkImage
        ]
        UploadImage.shared.upload(param, Constant.token) { [unowned self] in
            self.isSuccess = $0
            self.isConnect = $1
            self.dataMeter = $2
            guard let data = self.dataMeter else { return }
            if self.isConnect {
                if self.isSuccess {
                    self.disappearLoading()
                    let numberDetect = String(data.data.dropLast())
                    self.numberElectric = numberDetect
                    self.numberMeter(number: numberDetect,
                                     textField1: self.number1,
                                     textField2: self.number2,
                                     textField3: self.number3,
                                     textField4: self.number4,
                                     textField5: self.number5)
                } else {
                    self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                     message: NSLocalizedString(Constant.Alert.alertUploadFail, comment: ""))
                }
            } else {
                self.createAlert(title: NSLocalizedString(Constant.Alert.alertTitle, comment: ""),
                                 message: NSLocalizedString(Constant.Alert.internetError, comment: ""))
            }
        }
    }
    
    func uploadImage() {
        guard let image = imageElecticMeter.image, let data = image.jpegData(compressionQuality: 1.0) else {
            print("Wrong update image")
            return
        }
        let imageName = UUID().uuidString
        let imageReference = Storage.storage().reference(forURL: Urls.firebaseUpload).child(imageName)
        imageReference.putData(data, metadata: nil) { (metadata, error) in
            if error != nil {
                print(error)
                return
            }
            
            imageReference.downloadURL { (url, error) in
                if let imageUrl = url?.absoluteString {
                    Constant.linkImage = imageUrl
                    self.detectNumber()
//                    print(imageUrl)
                }
            }
        }
    }
    
    func convertImageToBase64String (img: UIImage) -> String {
        return img.jpegData(compressionQuality: 1)?.base64EncodedString() ?? ""
    }
}

extension UseLibrary: StoryboardSceneBased, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    static let sceneStoryboard = Storyboards.camera
    
    func showImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Thư viện ảnh", style: .default, handler: { (action: UIAlertAction) in
            imagePicker.sourceType = .photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageElecticMeter.image = editedImage
            imageTmp = imageElecticMeter.image
            showLoading()
            uploadImage()
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageElecticMeter.image = originalImage
            imageTmp = imageElecticMeter.image
            showLoading()
            uploadImage()
        }
        
        dismiss(animated: true, completion: nil)
    }
}
