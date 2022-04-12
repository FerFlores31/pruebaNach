//
//  PhotoTableViewCell.swift
//  PruebaNach
//
//  Created by Fer on 09/04/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    
    lazy var ownContent : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
     var iimageView : UIImageView = {
        let image = UIImageView()
        return image
        
    }()

    

    init(){
        super.init(style: .default, reuseIdentifier: nil)
      
        initUI()
      
        
    }
    
    func initUI(){
        
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(ownContent)
        ownContent.addSubview(iimageView)
        ownContent.addAnchorsAndSize(width: 100, height: 150, left: 100, top: 10, right: 100, bottom: nil)
        iimageView.addAnchorsWithMargin(30)
        
        
    }
 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
