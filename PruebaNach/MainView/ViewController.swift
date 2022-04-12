//
//  ViewController2.swift
//  PruebaNach
//
//  Created by Fer on 11/04/22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage

class ViewController: UIViewController, PopupDelegate{

    
    func updatePhoto(image: UIImage) {
        myImage = image
        viewTable.reloadData()
        
    }
    
    var charInt : CharInteractor?
    
    lazy var viewTable : UITableView = {
        let tableMenu = UITableView()
        tableMenu.backgroundColor = .white
        tableMenu.delegate = self
        tableMenu.dataSource = self
        return tableMenu
    }()
    
    lazy var buttonSend : UIButton = {
        let button = UIButton()
        button.setTitle("ENVIAR", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = colorBlu
        return button
    }()
    
    lazy var activeIndicator : UIActivityIndicatorView = {
        let act = UIActivityIndicatorView(style: .large)
        act.color = .black
        act.center = view.center
        return act
    }()
    
    var arrayMenu = ["user","photo","graph","teoria"]
    var myImage = UIImage(named: "selfie")
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        title = "Test iOS"
        initUI()
    }
    
    
    func initUI(){
        view.addSubview(viewTable)
        view.addSubview(buttonSend)
        view.addSubview(activeIndicator)
        viewTable.addAnchors(left: 0, top: 0 , right: 0, bottom: 80)
        buttonSend.addAnchorsAndSize(width: nil, height: 50, left: 20, top: 10, right: 20, bottom:20,withAnchor: .top,relativeToView: viewTable)
        buttonSend.addTarget(self, action: #selector(dateSend), for: .touchUpInside)
        
    }
    
    
    
    
    @objc func dateSend(){
        activeIndicator.startAnimating()
        guard let image = myImage, let datosImagen = image.jpegData(compressionQuality: 1.0) else {
            print("Error")
            return
        }

        let imageNombre = UUID().uuidString
        let imageReferencia = Storage.storage()
            .reference()
            .child("imagenes")
            .child(imageNombre)
        
        imageReferencia.putData(datosImagen, metadata: nil) { (metaData, error) in
            if let error = error {
                print("Error al subir imagen \(error.localizedDescription)")
                return
            }
            imageReferencia.downloadURL { (url, error) in
                if let err = error {
                    print("Error al subir imagen \(err.localizedDescription)")
                    return
                }
                
                guard let url = url else {
                    print("Error al crear url de la imagen")
                    return
                }
                
                let dataReferencia = Firestore.firestore().collection("imagenes").document()
                let documentoID = dataReferencia.documentID
                
                let urlString = url.absoluteString
                
                let datosEnviar = ["id": documentoID,
                            "url": urlString
                ]
                
                dataReferencia.setData(datosEnviar) { [self] (error) in
                    if let err = error {
                        print("Error al mandar datos de imagen \(err.localizedDescription)")
                        let alert: UIAlertController
                        alert = UIAlertController(title: "Error el enviar datos", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                        self.present(alert, animated: true)
                        return
                    } else {
                        
                        activeIndicator.stopAnimating()
                        print("Se guardó correctamente en FS")
                        let alert: UIAlertController
                        alert = UIAlertController(title: "Se guardo en FS", message: "", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                        self.present(alert, animated: true)
                        myImage = UIImage(named: "selfie")
                        viewTable.reloadData()
                       
                    }
                }
            }
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let optionSelected = arrayMenu[indexPath.row]

            switch optionSelected {
            case "user":
                return 100
            case "photo":
                return 180
            case "graph":
                return 450
            default:
                return 100
                break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let optionSelected = arrayMenu[indexPath.row]
        switch optionSelected {
        case "user":
            let cell = UserTableViewCell()
            return cell
        case "photo":
            let cell = PhotoTableViewCell()
            cell.iimageView.image = myImage
            return cell
        case "graph":
            let cell = GraphTableViewCell()
            return cell
        case "teoria":
            let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
            cell.textLabel?.text = "Teoria"
            return cell
        default:
            let cell = UITableViewCell()
            return cell
            break
        }
        
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionSelected = arrayMenu[indexPath.row]
        switch optionSelected {
 
        case "photo":
            let vc = PopupViewController()
            vc.delegate = self
            vc.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            vc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            present(vc, animated: true, completion: nil)
      case "graph":
            let vc = GraphicsRouter.startGraphics()
         navigationController?.pushViewController(vc, animated: true)
        case "teoria":
            let vc = TeoriaViewController()
            navigationController?.pushViewController(vc, animated: true)
            
        default:
          
            break
        }
        
    }
}
