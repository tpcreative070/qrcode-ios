//
//  Navigator.swift
//  qrscanner
//
//  Created by Mac10 on 3/5/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
class Navigator {

    static func getViewController() ->Dictionary<String,NavigationModel>{
        var dic = Dictionary<String,NavigationModel>()

        dic[Controller.scanner] = NavigationModel(storyBoard: UIStoryboard.main, identifier: Controller.scanner)
        dic[Controller.contact] = NavigationModel(storyBoard: UIStoryboard.main, identifier: Controller.contact)
        return dic
    }
    
    static func pushViewMainStoryboard<T : UIViewController>(from : T,identifier : String, isNavigation : Bool = false, isTransparent : Bool = false, present : Bool = false){
        if let value = getViewController()[identifier]{
            let storyboard = value.storyBoard
            let viewController = storyboard.instantiateViewController(withIdentifier: value.identifier)
            viewController.modalPresentationStyle = .fullScreen
            if isTransparent{
                 viewController.modalPresentationStyle = .overCurrentContext
            }
            present ? ( isNavigation ? from.navigationController?.pushViewController(viewController, animated: true) : from.present(viewController, animated: true,completion: nil)) :  (isNavigation ? from.navigationController?.pushViewController(viewController, animated: true) : from.navigationController?.present(viewController, animated: true,completion: nil))
        }
    }
    
    // Make sure setup get call pushPopupPresent
    static func getPopupViewControler<T: BaseViewController>(identifier : String) -> T {
        if let value = getViewController()[identifier]{
            let storyboard = value.storyBoard
            let popup = storyboard.instantiateViewController(withIdentifier: value.identifier) as! T
            popup.modalPresentationStyle = .overCurrentContext
            return popup
        }
        return T()
    }
    
    static func pushPopupPresent<F: BaseViewController, T: BaseViewController>(viewController: F, popupController: inout T){
        viewController.present(popupController, animated: true)
    }
    static func pushViewController<T :UIViewController >( from: T,to : T) {
       from.navigationController?.pushViewController(to, animated: true)
    }
}
