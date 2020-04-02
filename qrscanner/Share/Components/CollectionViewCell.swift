//
//  CollectionViewCell.swift
//  vietlifetravel
//
//  Created by phong070 on 7/12/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import UIKit
class CollectionViewCell : UICollectionViewCell{
    var delegate : CollectionViewCellDelegate?
    static var identifier =  EnumIdentifier.None
    
    let backGroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let subView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
   
    lazy var imgIcon : UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
       // Utils.logMessage(message: "EnumIdentifier.PAYMENTSERVICES")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func IndexTapped(sender: UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
    }
    
       func configView(view : ChangeColorViewModelDelegate){
        print(view.imgQRView)
        if view.imgQRView == ColorString.Black.rawValue{
            self.imgIcon.backgroundColor = AppColors.BLACK_COLOR
        }
        else if view.imgQRView == ColorString.Blue.rawValue {
            self.imgIcon.backgroundColor = AppColors.BLUE_IN_COLOR
        }
        else if view.imgQRView == ColorString.DarkGreen.rawValue {
                   self.imgIcon.backgroundColor = AppColors.DARK_GREEN_COLOR
               }
        else if view.imgQRView == ColorString.Pink.rawValue {
                   self.imgIcon.backgroundColor = AppColors.PINK_COLOR
               }
        else if view.imgQRView == ColorString.LightPurple.rawValue {
                   self.imgIcon.backgroundColor = AppColors.LIGHT_PURPLE_COLOR
               }
        else if view.imgQRView == ColorString.Purple.rawValue {
                   self.imgIcon.backgroundColor = AppColors.PURPLE_COLOR
               }
        else if view.imgQRView == ColorString.Indigo.rawValue {
                   self.imgIcon.backgroundColor = AppColors.INDIGO_COLOR
               }
        else if view.imgQRView == ColorString.BlackGreen.rawValue {
                   self.imgIcon.backgroundColor = AppColors.BLACK_GREEN_COLOR
               }
        else if view.imgQRView == ColorString.Cyan.rawValue {
                   self.imgIcon.backgroundColor = AppColors.CYAN_COLOR
               }
        else if view.imgQRView == ColorString.MossGreen.rawValue {
                          self.imgIcon.backgroundColor = AppColors.MOSS_GREEN_COLOR
                      }
        else if view.imgQRView == ColorString.Orange.rawValue {
                          self.imgIcon.backgroundColor = AppColors.ORANGE_IN_COLOR
                      }
        else if view.imgQRView == ColorString.Brown.rawValue {
                          self.imgIcon.backgroundColor = AppColors.BROWN_COLOR
                      }
       
//           if view.isSelectedView {
//               self.backGroundView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
//           }else{
//               self.backGroundView.backgroundColor = .clear
//           }
       }
   
}
