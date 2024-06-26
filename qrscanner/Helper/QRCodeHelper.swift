//
//  QRCodeHelper.swift
//  qrscanner
//
//  Created by phong070 on 4/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class QRCodeHelper {
    static let shared = QRCodeHelper()
    func generateDataQRCode(from string: String) -> UIImage? {
        do {
            let writer = ZXMultiFormatWriter()
            let hints = ZXEncodeHints() as ZXEncodeHints
            hints.encoding = String.Encoding.utf8.rawValue
            let result = try writer.encode(string, format: kBarcodeFormatQRCode, width: Int32(AppConstants.HEIGHT_IMAGE_QR), height: Int32(AppConstants.HEIGHT_IMAGE_QR), hints: hints)
            if let imageRef = ZXImage.init(matrix: result, on: AppColors.BLACK_COLOR.cgColor, offColor: nil) {
                if let image = imageRef.cgimage {
                    return UIImage.init(cgImage: image)
                }
            }
        }
        catch {
            print(error)
        }
        return nil
    }
    func setTextLabel(mString: String) -> String{
        if mString == BarcodeType.EAN_8.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8) ?? "EAN 8"
        }
        else if mString == BarcodeType.EAN_13.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_13) ?? "EAN 13"
        }
        else if mString == BarcodeType.PDF417.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.PDF417) ?? "PDF417"

        }
        else if mString == BarcodeType.Aztec.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "Aztec"
        }
        else if mString == BarcodeType.UPCE.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.UPCE) ?? "UPCE"
        }
        else if mString == BarcodeType.UPCA.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.UPCA) ?? "UPCA"
        }
        else if mString == BarcodeType.CODE128.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.Code_128) ?? "CODE 128"
        }
        else if mString == BarcodeType.CODE93.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.Code_93) ?? "CODE 93"
        }
        else if mString == BarcodeType.CODE39.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "CODE 39"
        }
        else if mString == BarcodeType.ITF.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.ITF) ?? "ITF"
        }
        else if mString == BarcodeType.CODABAR.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.CODABAR) ?? "CODABAR"
        }
        else{
            return LanguageHelper.getTranslationByKey(LanguageKey.NotFound) ?? "EAN 8"
        }
    }
    func getValueContent(typeCode: String, content: ContentViewModel) -> String? {
        if typeCode.count > 0 && content.content != nil {
            if typeCode == EnumType.URL.rawValue{
                let stringContent = content.content?.data(using: .utf8 )
                guard let urlModel : UrlModel = try? JSONDecoder().decode(UrlModel.self, from: stringContent!) else {return ""}
                return urlModel.url ?? ""
            }
            else if typeCode == EnumType.TEXT.rawValue{
               // let ct = "{\"text\": \"Hdj\\\'ik\"}"
                let stringContent = content.content?.data(using: .utf8 )
                guard let textModel : TextModel = try? JSONDecoder().decode(TextModel.self, from: stringContent!) else {return ""}
                return textModel.text ?? ""
//                guard let jsonData = content.content?.data(using: .utf8)  else {
//                    return ""
//                }
//                do{
//                           let urlData = try JSONDecoder().decode(TextModel.self, from: jsonData)
//                    Utils.logMessage(object: TextViewModel(text: urlData.text ?? ""))
//                           }
//                           catch(let err){
//                               print(err)
//                               return
//                           }
            }
            else if typeCode == EnumType.LOCATION.rawValue{
                let stringContent = content.content?.data(using: .utf8 )
                guard let locationModel : LocationModel = try? JSONDecoder().decode(LocationModel.self, from: stringContent!)else {return ""}
                return "\(locationModel.latitude ?? 0),\(locationModel.longtitude ?? 0),(\(locationModel.query ?? ""))"
            }
            else if typeCode == EnumType.EMAIL.rawValue{
                let stringContent = content.content?.data(using: .utf8 )
                guard let emailModel : EmailModel = try? JSONDecoder().decode(EmailModel.self, from: stringContent!)else {return ""}
                return emailModel.email ?? ""
            }
            else if typeCode == EnumType.EVENT.rawValue{
                
                
                let stringContent = content.content?.data(using: .utf8 )
                guard let  eventModel : EventModel = try? JSONDecoder().decode(EventModel.self, from: stringContent!)else {return ""}
                return eventModel.title ?? ""
                
            }
            else if typeCode == EnumType.MESSAGE.rawValue{
                
                
                let stringContent = content.content?.data(using: .utf8 )
                guard let messageModel : MessageModel = try? JSONDecoder().decode(MessageModel.self, from: stringContent!) else {return ""}
                return messageModel.message ?? ""
            }
            else if typeCode == EnumType.WIFI.rawValue{
                
                let stringContent = content.content?.data(using: .utf8 )
                guard let wifiModel : WifiModel = try? JSONDecoder().decode(WifiModel.self, from: stringContent!) else {return ""}
                return wifiModel.ssid ?? ""
            }
            else if typeCode == EnumType.TELEPHONE.rawValue{
                
                
                let stringContent = content.content?.data(using: .utf8 )
                guard let phoneModel : PhoneModel = try? JSONDecoder().decode(PhoneModel.self, from: stringContent!) else {return ""}
                return phoneModel.phone ?? ""
            }
            else if typeCode == EnumType.CONTACT.rawValue{
                let stringContent = content.content?.data(using: .utf8 )
                guard let contactModel : ContactModel = try? JSONDecoder().decode(ContactModel.self, from: stringContent!) else {return ""}
                return contactModel.fullNameContact ?? ""
            }
            else if typeCode == EnumType.BARCODE.rawValue{
                let stringContent = content.content?.data(using: .utf8 )
                guard let contactModel : BarcodeModel = try? JSONDecoder().decode(BarcodeModel.self, from: stringContent!) else {return ""}
                return contactModel.productID ?? ""
            }
            else{
                return "No value"
            }
        }
        else{
            return "No value"
        }
    }
    func getValueContent1(typeCode: String, data: String) -> String? {
            if typeCode == EnumType.URL.rawValue{
                       guard let urlModel = (data.toObject(value: UrlModel.self)) else {
                           return ""
                       }
                return urlModel.url
                   }
                   else if typeCode == EnumType.TEXT.rawValue{
                       guard let textModel = (data.toObject(value: TextModel.self)) else {
                           return ""
                       }
                        return textModel.text
                   }
                   else if typeCode == EnumType.LOCATION.rawValue{
                       guard let locationModel = (data.toObject(value: LocationModel.self)) else {
                           return ""
                       }
                return "\(locationModel.latitude ?? 0),\(locationModel.longtitude ?? 0),(\(locationModel.query ?? ""))"
                   }
                   else if typeCode == EnumType.EMAIL.rawValue{
                       guard let emailModel = (data.toObject(value: EmailModel.self)) else {
                           return ""
                       }
                       return emailModel.email ?? ""
                   }
                   else if typeCode == EnumType.EVENT.rawValue{
                       guard let eventModel = (data.toObject(value: EventModel.self)) else {
                           return ""
                       }
                       return eventModel.title ?? ""
                   }
                   else if typeCode == EnumType.MESSAGE.rawValue{
                       guard let messageModel = (data.toObject(value: MessageModel.self)) else {
                           return ""
                       }
                       return messageModel.message ?? ""
                   }
                   else if typeCode == EnumType.WIFI.rawValue{
                       guard let wifiModel = (data.toObject(value: WifiModel.self)) else {
                           return ""
                       }
                        return wifiModel.ssid ?? ""
                   }
                   else if typeCode == EnumType.TELEPHONE.rawValue{
                       guard let phoneModel = (data.toObject(value: PhoneModel.self)) else {
                           return ""
                       }
                        return phoneModel.phone ?? ""
                   }
                   else if typeCode == EnumType.CONTACT.rawValue{
                       guard let contactModel = (data.toObject(value: ContactModel.self)) else {
                           return ""
                       }
                       return contactModel.fullNameContact ?? ""
                   }
                   else if typeCode == EnumType.BARCODE.rawValue{
                       guard let barcode = (data.toObject(value: BarcodeModel.self)) else {
                           return ""
                       }
                       return barcode.productID ?? ""
                   }
                   
        else{
                      return "No value"
                  }
        
        }
    func convertStringtoContent(typeCode: String, data: String) -> ContentViewModel {
               if typeCode == EnumType.URL.rawValue{
                          guard let urlModel = (data.toObject(value: UrlModel.self)) else {
                              return ContentViewModel()
                          }
                   return ContentViewModel(data: urlModel)
                      }
                      else if typeCode == EnumType.TEXT.rawValue{
                          guard let textModel = (data.toObject(value: TextModel.self)) else {
                              return ContentViewModel()
                          }
                           return ContentViewModel(data: textModel)
                      }
                      else if typeCode == EnumType.LOCATION.rawValue{
                          guard let locationModel = (data.toObject(value: LocationModel.self)) else {
                              return ContentViewModel()
                          }
                  return ContentViewModel(data: locationModel)
                      }
                      else if typeCode == EnumType.EMAIL.rawValue{
                          guard let emailModel = (data.toObject(value: EmailModel.self)) else {
                              return ContentViewModel()
                          }
                        return ContentViewModel(data: emailModel)

                      }
                      else if typeCode == EnumType.EVENT.rawValue{
                          guard let eventModel = (data.toObject(value: EventModel.self)) else {
                              return ContentViewModel()
                          }
                       return ContentViewModel(data: eventModel)

                      }
                      else if typeCode == EnumType.MESSAGE.rawValue{
                          guard let messageModel = (data.toObject(value: MessageModel.self)) else {
                              return ContentViewModel()
                          }
                         return ContentViewModel(data: messageModel)
                      }
                      else if typeCode == EnumType.WIFI.rawValue{
                          guard let wifiModel = (data.toObject(value: WifiModel.self)) else {
                              return ContentViewModel()
                          }
                           return ContentViewModel(data: wifiModel)
                      }
                      else if typeCode == EnumType.TELEPHONE.rawValue{
                          guard let phoneModel = (data.toObject(value: PhoneModel.self)) else {
                              return ContentViewModel()
                          }
                           return ContentViewModel(data: phoneModel)
                      }
                      else if typeCode == EnumType.CONTACT.rawValue{
                          guard let contactModel = (data.toObject(value: ContactModel.self)) else {
                              return ContentViewModel()
                          }
                         return ContentViewModel(data: contactModel)
                      }
                      else if typeCode == EnumType.BARCODE.rawValue{
                          guard let barcode = (data.toObject(value: BarcodeModel.self)) else {
                              return ContentViewModel()
                          }
                         return ContentViewModel(data: barcode)
                      }
                      
           else{
                         return ContentViewModel()
                     }
           
           }
}
