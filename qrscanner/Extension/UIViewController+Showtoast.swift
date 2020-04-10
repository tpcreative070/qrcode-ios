//
//  UIViewController+Keyboard.swift
//  qrscanner
//
//  Created by Mac10 on 3/6/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//


import UIKit
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
       var historyArray:[Dictionary<String, AnyObject>] =  Array()
        for i in listValue {
            var dct = Dictionary<String, AnyObject>()
            dct.updateValue(i.createdDateTimeView as AnyObject, forKey: "createDateTime")
            dct.updateValue(i.typeCode as AnyObject, forKey: "typeCode")
            dct.updateValue(("") as AnyObject, forKey: "productID")
            dct.updateValue(("") as AnyObject, forKey: "ISBN")
            dct.updateValue(("") as AnyObject, forKey: "url")
            dct.updateValue(("") as AnyObject, forKey: "text")
            dct.updateValue(("") as AnyObject, forKey: "phone")
            dct.updateValue(("") as AnyObject, forKey: "email")
            dct.updateValue(("") as AnyObject, forKey: "subject")
            dct.updateValue(("") as AnyObject, forKey: "message")
            dct.updateValue(("") as AnyObject, forKey: "latitude")
            dct.updateValue(("") as AnyObject, forKey: "longtitude")
            dct.updateValue(("") as AnyObject, forKey: "query")
            dct.updateValue(("") as AnyObject, forKey: "title")
            dct.updateValue(("") as AnyObject, forKey: "location")
            dct.updateValue(("") as AnyObject, forKey: "description")
            dct.updateValue(("") as AnyObject, forKey: "beginTime")
            dct.updateValue(("") as AnyObject, forKey: "endTime")
            dct.updateValue(("") as AnyObject, forKey: "fullname")
            dct.updateValue(("") as AnyObject, forKey: "address")
            dct.updateValue(("") as AnyObject, forKey: "ssid")
            dct.updateValue(("") as AnyObject, forKey: "password")
            dct.updateValue(("") as AnyObject, forKey: "network")
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: i.content)
            let value_data = valueContentView?.content
            let stringContent = value_data!.data(using: .utf8)!
            let typeCode = valueContentView?.typeCode?.uppercased()
            if typeCode == EnumType.URL.rawValue{
                let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent)
                dct.updateValue(urlModel.url as AnyObject, forKey: "url")
            }
           
            if typeCode == EnumType.MESSAGE.rawValue{
                let messModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent)
                dct.updateValue(messModel.to as AnyObject, forKey: "phone")
                dct.updateValue(messModel.message as AnyObject, forKey: "message")
            }
            if typeCode == EnumType.LOCATION.rawValue{
                let data : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent)
                dct.updateValue(String(data.latitude ?? 0) as AnyObject, forKey: "latitude")
                dct.updateValue(String(data.longtitude ?? 0) as AnyObject, forKey: "longtitude")
                dct.updateValue(String(data.query!) as AnyObject, forKey: "query")
                
            }
            if typeCode == EnumType.EVENT.rawValue{
                let data : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent)
                dct.updateValue((data.title) as AnyObject, forKey: "title")
                dct.updateValue((data.location) as AnyObject, forKey: "location")
                dct.updateValue((data.description) as AnyObject, forKey: "description")
                dct.updateValue((data.beginTime) as AnyObject, forKey: "beginTime")
                dct.updateValue((data.endTime) as AnyObject, forKey: "endTime")
            }
            if typeCode == EnumType.CONTACT.rawValue{
                let data : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent)
                dct.updateValue((data.fullNameContact) as AnyObject, forKey: "fullname")
                dct.updateValue((data.emailContact) as AnyObject, forKey: "address")
                dct.updateValue((data.addressContact) as AnyObject, forKey: "description")
                dct.updateValue((data.phoneContact) as AnyObject, forKey: "phone")
            }
            if typeCode == EnumType.TELEPHONE.rawValue{
                let data : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent)
                dct.updateValue((data.phone) as AnyObject, forKey: "phone")
                
            }
            if typeCode == EnumType.TEXT.rawValue{
                let data : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent)
                dct.updateValue((data.text) as AnyObject, forKey: "text")
                
            }
            if typeCode == EnumType.WIFI.rawValue{
                let data : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent)
                dct.updateValue((data.ssid) as AnyObject, forKey: "ssid")
                dct.updateValue((data.password) as AnyObject, forKey: "password")
                dct.updateValue((data.protect) as AnyObject, forKey: "network")
            }
           
         
           historyArray.append(dct)
        }
        self.createCSV(from: historyArray)
    }
    func getCSVSave(listValue : [SaveViewModel] ){
       var historyArray:[Dictionary<String, AnyObject>] =  Array()
        for i in listValue {
            var dct = Dictionary<String, AnyObject>()
            dct.updateValue(i.createdDateTimeView as AnyObject, forKey: "createDateTime")
            dct.updateValue(i.content.typeCode as AnyObject, forKey: "typeCode")
            dct.updateValue(("") as AnyObject, forKey: "productID")
            dct.updateValue(("") as AnyObject, forKey: "ISBN")
            dct.updateValue(("") as AnyObject, forKey: "url")
            dct.updateValue(("") as AnyObject, forKey: "text")
            dct.updateValue(("") as AnyObject, forKey: "phone")
            dct.updateValue(("") as AnyObject, forKey: "email")
            dct.updateValue(("") as AnyObject, forKey: "subject")
            dct.updateValue(("") as AnyObject, forKey: "message")
            dct.updateValue(("") as AnyObject, forKey: "latitude")
            dct.updateValue(("") as AnyObject, forKey: "longtitude")
            dct.updateValue(("") as AnyObject, forKey: "query")
            dct.updateValue(("") as AnyObject, forKey: "title")
            dct.updateValue(("") as AnyObject, forKey: "location")
            dct.updateValue(("") as AnyObject, forKey: "description")
            dct.updateValue(("") as AnyObject, forKey: "beginTime")
            dct.updateValue(("") as AnyObject, forKey: "endTime")
            dct.updateValue(("") as AnyObject, forKey: "fullname")
            dct.updateValue(("") as AnyObject, forKey: "address")
            dct.updateValue(("") as AnyObject, forKey: "ssid")
            dct.updateValue(("") as AnyObject, forKey: "password")
            dct.updateValue(("") as AnyObject, forKey: "network")
            let valueContentView = JSONHelper.get(value: ContentViewModel.self,anyObject: i.content)
            let value_data = valueContentView?.content
            let stringContent = value_data!.data(using: .utf8)!
            let typeCode = valueContentView?.typeCode?.uppercased()
            if typeCode == EnumType.URL.rawValue{
                let urlModel : UrlModel = try! JSONDecoder().decode(UrlModel.self, from: stringContent)
                dct.updateValue(urlModel.url as AnyObject, forKey: "url")
            }
           
            if typeCode == EnumType.MESSAGE.rawValue{
                let messModel : MessageModel = try! JSONDecoder().decode(MessageModel.self, from: stringContent)
                dct.updateValue(messModel.to as AnyObject, forKey: "phone")
                dct.updateValue(messModel.message as AnyObject, forKey: "message")
            }
            if typeCode == EnumType.LOCATION.rawValue{
                let data : LocationModel = try! JSONDecoder().decode(LocationModel.self, from: stringContent)
                dct.updateValue(String(data.latitude ?? 0) as AnyObject, forKey: "latitude")
                dct.updateValue(String(data.longtitude ?? 0) as AnyObject, forKey: "longtitude")
                dct.updateValue(String(data.query!) as AnyObject, forKey: "query")
                
            }
            if typeCode == EnumType.EVENT.rawValue{
                let data : EventModel = try! JSONDecoder().decode(EventModel.self, from: stringContent)
                dct.updateValue((data.title) as AnyObject, forKey: "title")
                dct.updateValue((data.location) as AnyObject, forKey: "location")
                dct.updateValue((data.description) as AnyObject, forKey: "description")
                dct.updateValue((data.beginTime) as AnyObject, forKey: "beginTime")
                dct.updateValue((data.endTime) as AnyObject, forKey: "endTime")
            }
            if typeCode == EnumType.CONTACT.rawValue{
                let data : ContactModel = try! JSONDecoder().decode(ContactModel.self, from: stringContent)
                dct.updateValue((data.fullNameContact) as AnyObject, forKey: "fullname")
                dct.updateValue((data.emailContact) as AnyObject, forKey: "address")
                dct.updateValue((data.addressContact) as AnyObject, forKey: "description")
                dct.updateValue((data.phoneContact) as AnyObject, forKey: "phone")
            }
            if typeCode == EnumType.TELEPHONE.rawValue{
                let data : PhoneModel = try! JSONDecoder().decode(PhoneModel.self, from: stringContent)
                dct.updateValue((data.phone) as AnyObject, forKey: "phone")
                
            }
            if typeCode == EnumType.TEXT.rawValue{
                let data : TextModel = try! JSONDecoder().decode(TextModel.self, from: stringContent)
                dct.updateValue((data.text) as AnyObject, forKey: "text")
                
            }
            if typeCode == EnumType.WIFI.rawValue{
                let data : WifiModel = try! JSONDecoder().decode(WifiModel.self, from: stringContent)
                dct.updateValue((data.ssid) as AnyObject, forKey: "ssid")
                dct.updateValue((data.password) as AnyObject, forKey: "password")
                dct.updateValue((data.protect) as AnyObject, forKey: "network")
            }
           
         
           historyArray.append(dct)
        }
        self.createCSV(from: historyArray)
    }
    func createCSV(from recArray:[Dictionary<String, AnyObject>]) {
          var csvString = "\("FormatType"),\("Url"),\("Text"),\("ProductID"),\("ISBN"),\("Phone"),\("Email"),\("Subject"),\("Message")\("Latitude"),\("Longtitude"),\("Query"),\("Title"),\("Location"),\("Description"),\("StartEvent"),\("EndEvent"),\("FullName"),\("Address"),\("SSID"),\("Password"),\("NetworkEncryption"),\("CreateDateTime")"
          
          for dct in recArray {
              csvString = csvString.appending("\(String(describing: dct["typeCode"]!)) ,\(String(describing: dct["url"]!)),\(String(describing: dct["text"]!)),\(String(describing: dct["productID"]!)),\(String(describing: dct["ISBN"]!)),\(String(describing: dct["phone"]!)),\(String(describing: dct["email"]!)),\(String(describing: dct["subject"]!)),\(String(describing: dct["message"]!)),\(String(describing: dct["latitude"]!)),\(String(describing: dct["longtitude"]!)),\(String(describing: dct["query"]!)),\(String(describing: dct["title"]!)),\(String(describing: dct["location"]!)),\(String(describing: dct["description"]!)),\(String(describing: dct["beginTime"]!)),\(String(describing: dct["endTime"]!)),\(String(describing: dct["fullname"]!)),\(String(describing: dct["address"]!)),\(String(describing: dct["ssid"]!)),\(String(describing: dct["password"]!)),\(String(describing: dct["network"]!)),\(String(describing: dct["createDateTime"]!))\n")
          }
          
          let fileManager = FileManager.default
          do {
              let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
              let nameSave = "FILECSV_\(TimeHelper.getString(time: Date(), dateFormat: TimeHelper.StandardSortedDateTime)).csv"
              let fileURL = path.appendingPathComponent(nameSave)
              print(fileURL)
              try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
              let activiController = UIActivityViewController(activityItems: [fileURL], applicationActivities: nil)
              self.present(activiController,animated: true, completion: nil)
          } catch {
              print("error creating file")
          }
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
