//
//  UIViewController+Keyboard.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//


import UIKit
import SwiftCSVExport
extension UIViewController {
    
    func showToast(message : String, font: UIFont) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    } 
    func getCSVHistory(listValue : [HistoryViewModel] ){
        let historyArray:NSMutableArray  = NSMutableArray()
        for i in listValue {
            let value:NSMutableDictionary = NSMutableDictionary()
            value.setObject(i.typeCode, forKey: "FormatType" as NSCopying)
            value.setObject(i.createdDateTimeView, forKey: "CreateDateTime" as NSCopying)
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: i.content)
            let value_data = valueContentView?.content
            let stringContent = value_data!.data(using: .utf8)!
            let typeCode = valueContentView?.typeCode?.uppercased()
            if typeCode == EnumType.URL.rawValue{
                let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent)
                value.setObject("\"\(urlModel.url ?? "") \"", forKey: "Url" as NSCopying )
            }
            if typeCode == EnumType.TEXT.rawValue{
                let data : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent)
                print("\"\(data.text ?? "") \"")
                value.setObject("\"\(data.text ?? "") \"", forKey: "Text" as NSCopying )
                
            }
            if typeCode == EnumType.MESSAGE.rawValue{
                let messModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent)
                value.setObject("\"\(messModel.to ?? "") \"", forKey: "Phone" as NSCopying )
                value.setObject("\"\(messModel.message ?? "") \"", forKey: "Message" as NSCopying )
            }
            if typeCode == EnumType.LOCATION.rawValue{
                let data : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent)
                value.setObject("\"\(data.latitude ?? 0) \"", forKey: "Latitude" as NSCopying )
                value.setObject("\"\(data.longtitude ?? 0) \"", forKey: "Longtitude" as NSCopying )
                value.setObject("\"\(data.query ?? "") \"", forKey: "Query" as NSCopying )
                
            }
            if typeCode == EnumType.EVENT.rawValue{
                let data : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent)
                value.setObject("\"\(data.title ?? "") \"", forKey: "Title" as NSCopying )
                value.setObject("\"\(data.location ?? "") \"", forKey: "Location" as NSCopying )
                value.setObject("\"\(data.description ?? "") \"", forKey: "Description" as NSCopying )
                value.setObject("\"\(data.beginTime ?? "") \"", forKey: "StartEvent" as NSCopying )
                value.setObject("\"\(data.endTime ?? "") \"", forKey: "EndEvent" as NSCopying )
            }
            if typeCode == EnumType.CONTACT.rawValue{
                let data : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent)
                value.setObject("\"\(data.fullNameContact ?? "") \"", forKey: "FullName" as NSCopying )
                value.setObject("\"\(data.emailContact ?? "") \"", forKey: "Email" as NSCopying )
                value.setObject("\"\(data.addressContact ?? "") \"", forKey: "Address" as NSCopying )
                value.setObject("\"\(data.phoneContact ?? "") \"", forKey: "Phone" as NSCopying )
            }
            if typeCode == EnumType.TELEPHONE.rawValue{
                let data : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent)
                value.setObject("\"\(data.phone ?? "") \"", forKey: "Phone" as NSCopying )
            }
            
            if typeCode == EnumType.WIFI.rawValue{
                let data : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent)
                value.setObject("\"\(data.ssid ?? "") \"", forKey: "SSID" as NSCopying )
                value.setObject("\"\(data.password ?? "") \"", forKey: "Password" as NSCopying )
                value.setObject("\"\(data.protect ?? "") \"", forKey: "NetworkEncryption" as NSCopying )
                
            }
            if typeCode == EnumType.EMAIL.rawValue{
                           let data : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent)
                value.setObject("\"\(data.email ?? "") \"", forKey: "Email" as NSCopying )
                value.setObject("\"\(data.objectEmail ?? "") \"", forKey: "Subject" as NSCopying )
                value.setObject("\"\(data.messageEmail ?? "") \"", forKey: "Message" as NSCopying )
                           
                       }
            if typeCode == EnumType.BARCODE.rawValue{
                let data : BarcodeModel = try! JSONDecoder().decode(BarcodeModel.self, from: stringContent)
                value.setObject("\"\(data.productID ?? "") \"", forKey: "ProductID" as NSCopying )
                value.setObject("\"\(data.barcodetype ?? "") \"", forKey: "ISBN" as NSCopying )

            }
            historyArray.add(value);
        }
       // Utils.logMessage(object: historyArray)
        createCSV(from: historyArray)
    }
    func createCSV(from historyArray: NSMutableArray ) {
        let header = ["FormatType", "Url", "Text", "ProductID", "ISBN","Phone","Email","Subject","Message","Latitude","Longtitude","Query","Title","Location","Description","StartEvent","EndEvent","FullName","Address","SSID","Password","NetworkEncryption","CreateDateTime"]
        let writeCSVObj = CSV()
        writeCSVObj.rows = historyArray
        Utils.logMessage(object: historyArray)
        writeCSVObj.delimiter = DividerType.semicolon.rawValue
        writeCSVObj.fields = header as NSArray
        writeCSVObj.name = "FILECSV_\(TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime))"
        let output = CSVExport.export(writeCSVObj);

        if output.result.isSuccess {
            guard let filePath =  output.filePath else {
                print("Export Error: \(String(describing: output.message))")
                return
            }
            print("File Path: \(filePath)")
            let _ = CSVExport.readCSVObject(filePath);
           // let request = NSURLRequest(url:  URL(fileURLWithPath: filePath) )
            //                      try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
            let activiController = UIActivityViewController(activityItems: [URL(fileURLWithPath: filePath)], applicationActivities: nil)
            if DeviceHelper.isIpad(){
                if let popoverController = activiController.popoverPresentationController {
                    popoverController.sourceView = self.view //to set the source of your alert
                    popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
                    popoverController.permittedArrowDirections = [.up] //to hide the arrow of any particular direction
                }
            }
            self.present(activiController,animated: true, completion: nil)
        }
    }
    
    func getCSVSave(listValue : [SaveViewModel] ){
           let saveArray:NSMutableArray  = NSMutableArray()
           for i in listValue {
               let value:NSMutableDictionary = NSMutableDictionary()
               value.setObject(i.typeCode, forKey: "FormatType" as NSCopying)
               value.setObject(i.createdDateTimeView, forKey: "CreateDateTime" as NSCopying)
               let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: i.content)
               let value_data = valueContentView?.content
               let stringContent = value_data!.data(using: .utf8)!
               let typeCode = valueContentView?.typeCode?.uppercased()
               if typeCode == EnumType.URL.rawValue{
                   let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent)
                   value.setObject("\"\(urlModel.url ?? "") \"", forKey: "Url" as NSCopying )
               }
               if typeCode == EnumType.TEXT.rawValue{
                   let data : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent)
                   value.setObject("\"\(data.text ?? "") \"", forKey: "Text" as NSCopying )
                   
               }
               if typeCode == EnumType.MESSAGE.rawValue{
                   let messModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent)
                   value.setObject("\"\(messModel.to ?? "") \"", forKey: "Phone" as NSCopying )
                   value.setObject("\"\(messModel.message ?? "") \"", forKey: "Message" as NSCopying )
               }
               if typeCode == EnumType.LOCATION.rawValue{
                   let data : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent)
                   value.setObject("\"\(data.latitude ?? 0) \"", forKey: "Latitude" as NSCopying )
                   value.setObject("\"\(data.longtitude ?? 0) \"", forKey: "Longtitude" as NSCopying )
                   value.setObject("\"\(data.query ?? "") \"", forKey: "Query" as NSCopying )
                   
               }
               if typeCode == EnumType.EVENT.rawValue{
                   let data : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent)
                   value.setObject("\"\(data.title ?? "") \"", forKey: "Title" as NSCopying )
                   value.setObject("\"\(data.location ?? "") \"", forKey: "Location" as NSCopying )
                   value.setObject("\"\(data.description ?? "") \"", forKey: "Description" as NSCopying )
                   value.setObject("\"\(data.beginTime ?? "") \"", forKey: "BeginTime" as NSCopying )
                   value.setObject("\"\(data.endTime ?? "") \"", forKey: "EndTime" as NSCopying )
               }
               if typeCode == EnumType.CONTACT.rawValue{
                   let data : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent)
                   value.setObject("\"\(data.fullNameContact ?? "") \"", forKey: "FullName" as NSCopying )
                   value.setObject("\"\(data.emailContact ?? "") \"", forKey: "Email" as NSCopying )
                   value.setObject("\"\(data.addressContact ?? "") \"", forKey: "Address" as NSCopying )
                   value.setObject("\"\(data.phoneContact ?? "") \"", forKey: "Phone" as NSCopying )
               }
               if typeCode == EnumType.TELEPHONE.rawValue{
                   let data : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent)
                   value.setObject("\"\(data.phone ?? "") \"", forKey: "Phone" as NSCopying )
               }
               if typeCode == EnumType.EMAIL.rawValue{
                          let data : EmailModel = try! JSONDecoder().decode(EmailModel.self, from: stringContent)
               value.setObject("\"\(data.email ?? "") \"", forKey: "Email" as NSCopying )
               value.setObject("\"\(data.objectEmail ?? "") \"", forKey: "Subject" as NSCopying )
               value.setObject("\"\(data.messageEmail ?? "") \"", forKey: "Message" as NSCopying )
                          
                      }
               if typeCode == EnumType.WIFI.rawValue{
                   let data : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent)
                   value.setObject("\"\(data.ssid ?? "") \"", forKey: "SSID" as NSCopying )
                   value.setObject("\"\(data.password ?? "") \"", forKey: "Password" as NSCopying )
                value.setObject("\"\(data.protect ?? "") \"", forKey: "NetworkEncryption" as NSCopying )
                   
               }
               if typeCode == EnumType.BARCODE.rawValue{
                   let data : BarcodeModel = try! JSONDecoder().decode(BarcodeModel.self, from: stringContent)
                   value.setObject("\"\(data.productID ?? "") \"", forKey: "ProductID" as NSCopying )
                value.setObject("\"\(data.barcodetype ?? "") \"", forKey: "ISBN" as NSCopying )

               }
               saveArray.add(value);
           }
           Utils.logMessage(object: saveArray)
           createCSV(from: saveArray)
       }
    func changeColorQRCode(imgQRCode : UIImageView){
        imgQRCode.image = imgQRCode.image?.withRenderingMode(.alwaysTemplate)
        let value = String(CommonService.getUserDefault(key: KeyUserDefault.ChangeColor) ?? ColorString.Black.rawValue)
        if value == ColorString.Black.rawValue{
            
            imgQRCode.tintColor = AppColors.BLACK_COLOR
            
        }
        else if value == ColorString.Blue.rawValue {
            imgQRCode.tintColor = AppColors.BLUE_IN_COLOR
        }
        else if value == ColorString.DarkGreen.rawValue {
            imgQRCode.tintColor = AppColors.DARK_GREEN_COLOR
        }
        else if value == ColorString.Pink.rawValue {
            imgQRCode.tintColor = AppColors.PINK_COLOR
        }
        else if value == ColorString.LightPurple.rawValue {
            imgQRCode.tintColor = AppColors.LIGHT_PURPLE_COLOR
        }
        else if value == ColorString.Purple.rawValue {
            imgQRCode.tintColor = AppColors.PURPLE_COLOR
        }
        else if value == ColorString.Indigo.rawValue {
            imgQRCode.tintColor = AppColors.INDIGO_COLOR
        }
        else if value == ColorString.BlackGreen.rawValue {
            imgQRCode.tintColor = AppColors.BLACK_GREEN_COLOR
        }
        else if value == ColorString.Cyan.rawValue {
            imgQRCode.tintColor = AppColors.CYAN_COLOR
        }
        else if value == ColorString.MossGreen.rawValue {
            imgQRCode.tintColor = AppColors.MOSS_GREEN_COLOR
        }
        else if value == ColorString.Orange.rawValue {
            imgQRCode.tintColor = AppColors.ORANGE_IN_COLOR
        }
        else if value == ColorString.Brown.rawValue {
            imgQRCode.tintColor = AppColors.BROWN_COLOR
        }
        
    }
    
}
