//
//  ShareViewController.swift
//  ShareImage
//
//  Created by Mac10 on 4/5/20.
//  Copyright © 2020 Mac10. All rights reserved.
//

import UIKit
import Social
import MobileCoreServices

class ShareViewController: SLComposeServiceViewController {
    var sharedindentifier = "group.co.tpcreative.qrscanner.share"
    var shareKey = "Images"
    var seletedImage : UIImage!
    var maxCharacterCount = 100
    var imagesData: [Data] = []
    let myGroup = DispatchGroup()
    var flag : Bool = false
    override func viewDidLoad() {
        UserDefaults(suiteName: self.sharedindentifier)!.removeObject(forKey: "Images")
        self.getListImage()
        
       
    }
    func checkFlag(){
        if flag {
//            let str = "hello"
//              let message = str.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//                   let secondPath = "qrscanner://\(message ?? "")"
//                   let appUrl = URL(string: secondPath)
                     //  application.open(appUrl!, options: [:], completionHandler: nil)
                        self.openURL(url:NSURL(string:"qrscanner://co.tpcreative.qrscanner")!)
//            openURL(appUrl!)
        
               }
    }
   
    func getListImage(){
        
        if let content = extensionContext!.inputItems[0] as? NSExtensionItem {
            let contentType = kUTTypeImage as String
            
            // Verify the provider is valid
            if let contents = content.attachments as? [NSItemProvider] {
                // look for images
                for attachment in contents {
                    if attachment.hasItemConformingToTypeIdentifier(contentType) {
                        attachment.loadItem(forTypeIdentifier: contentType, options: nil) { data, error in
                            let url = data as! URL
                            
                            let imageData = try? Data(contentsOf: url)
                            self.imagesData.append(imageData!)
                            if self.imagesData.count > 0 {
                                               DispatchQueue.main.async {
                                                self.saveImage(self.shareKey, imageData: self.imagesData)
                                                   self.flag = true
                                                 self.checkFlag()
                                               }
                               
                                           }
                        }
                    }
                }
               
            }
        }
        
     
        
    }
    func saveImage(_ color: String, imageData: [Data]) {
        if let prefs = UserDefaults(suiteName: sharedindentifier) {
            prefs.removeObject(forKey: color)
            prefs.set(imageData, forKey: color)
        }
    }
  
    @objc func openURL(_ url: URL) -> Bool {
        var responder: UIResponder? = self
        while responder != nil {
            if let application = responder as? UIApplication {
                return application.perform(#selector(openURL(_:)), with: url) != nil
            }
            responder = responder?.next
        }
        return false
    }
    
   
    
    override func configurationItems() -> [Any]! {
        // To add configuration options via table cells at the bottom of the sheet, return an array of SLComposeSheetConfigurationItem here.
        return []
    }
    
}
extension SLComposeServiceViewController {
    
    func openURL(url: NSURL) -> Bool {
        do {
            let application = try self.sharedApplication()
            return application.performSelector(inBackground: "openURL:", with: url) != nil
        }
        catch {
            return false
        }
    }
    
    func sharedApplication() throws -> UIApplication {
        var responder: UIResponder? = self
        while responder != nil {
            if let application = responder as? UIApplication {
                return application
            }
            
            responder = responder?.next
        }
        
        throw NSError(domain: "UIInputViewController+sharedApplication.swift", code: 1, userInfo: nil)
    }
    
}
