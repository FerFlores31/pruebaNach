//
//  PopupViewController.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

protocol PopupDelegate {
    func updatePhoto(image: UIImage)
}

class PopupViewController: UIViewController, UINavigationControllerDelegate {
    
    var delegate : PopupDelegate?
    
    lazy var viewFont : UIView = {
        let viewF = UIView()
        viewF.backgroundColor = .black
        viewF.alpha = 0.3
        return viewF
    }()
    
    
    lazy var viewPopup : UIView = {
        let viewP = UIView()
        viewP.backgroundColor = .white
        viewP.layer.cornerRadius = 20
        return viewP
    }()
  
    lazy var buttonPhoto : UIButton = {
        let button = UIButton()
        button.setTitle("Tomar foto", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = colorBlu
        button.layer.cornerRadius = 5
        button.addTarget(self,  action: #selector(accionPhoto), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonView : UIButton = {
        let button = UIButton()
        button.setTitle("Visualizar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = colorBlu
        button.layer.cornerRadius = 5
        button.addTarget(self,  action: #selector(accionView), for: .touchUpInside)
        return button
    }()

    
    var myImage = UIImage()

    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        super.viewDidLoad()
        initUI()

    }
    
    
    func initUI(){
        
        view.addSubview(viewFont)
        view.addSubview(viewPopup)
        viewPopup.addSubview(buttonView)
        viewPopup.addSubview(buttonPhoto)
     
        viewFont.addAnchorsWithMargin(0)
        viewPopup.addAnchorsAndSize(width: nil, height: 200, left: 10, top: height / 3 , right: 10, bottom: nil)
        buttonView.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 50, right: 20, bottom: nil)
        buttonPhoto.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 10, right: 20, bottom: nil,withAnchor: .top,relativeToView: buttonView)
            
    }
    

    
    @objc func accionPhoto(){
        
        let imagePickerC = UIImagePickerController()
        imagePickerC.delegate = self
        imagePickerC.sourceType = UIImagePickerController.SourceType.camera
        self.present(imagePickerC, animated: true, completion: nil)
     
    }
    
    @objc func accionView(){
        
        self.dismiss(animated: true)
    
    }

  

}

extension PopupViewController : UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        myImage = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)!
        
        picker.dismiss(animated: true, completion: { [self] in
            delegate?.updatePhoto(image: myImage)
        })
       }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
       }
            
      
}
