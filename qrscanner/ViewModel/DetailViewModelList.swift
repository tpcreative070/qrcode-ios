//
//  DetailViewModelList.swift
//  qrscanner
//
//  Created by Mac10 on 3/17/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import Foundation
class DetailViewModelList : DetailViewModelListDelegate {
    
    
    var currentCellurl: UrlViewModel?
    var currentCelltext: TextViewModel?
   var currentCellphone: PhoneViewModel?
    var currentCellemail: EmailViewModel?
    var currentCellwifi: WifiViewModel?
    var currentCellcontact: ContactViewModel?
    var currentCelllocation: LocationViewModel?
    var currentCellmessage: MessageViewModel?
    var currentCellevent: EventViewModel?
    var currentCell : HistoryViewModel?

    var responseToView: ((String) -> ())?
    var showLoading: Bindable<Bool> = Bindable(false)
    var onShowError: ((SingleButtonAlert) -> Void)?
    var listurl: [UrlViewModel] = [UrlViewModel]()
    var listtext: [TextViewModel] = [TextViewModel]()
     var listphone: [PhoneViewModel] = [PhoneViewModel]()
    var listemail: [EmailViewModel] = [EmailViewModel]()
    var listwifi: [WifiViewModel] = [WifiViewModel]()
    var listcontact: [ContactViewModel] = [ContactViewModel]()
    var listlocation: [LocationViewModel] = [LocationViewModel]()
    var listmessage: [MessageViewModel] = [MessageViewModel]()
    var listevent: [EventViewModel] = [EventViewModel]()
    var listhistory:[HistoryViewModel] = [HistoryViewModel]()
    
    
    var urlValue = ""
    var textValue = ""
    var phoneValue = ""
    var toemail = ""
    var subjectemail = ""
    var messageemail = ""
    var ssid = ""
    var pass = ""
    var hidden = ""
    var network = ""
    
    var contact : ContactModel?
    var location : LocationModel?
    var message : MessageModel?
    var event : EventModel?
    var history: GenerateEntityModel?
    func getListHistory(){
        listhistory.append(HistoryViewModel(data: history!))
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    func getListUrl(){
        listurl.append(UrlViewModel(url: urlValue ));
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
 func getListText(){
      listtext.append(TextViewModel(text: textValue ));
      responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
  }
    func getListPhone(){
        listphone.append(PhoneViewModel(text: phoneValue ));
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    func getListEmail(){
          listemail.append(EmailViewModel(to: toemail, subject: subjectemail, message: messageemail));
          responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
      }
    func getListWifi(){
        listwifi.append(WifiViewModel(ssid: ssid, hidden: hidden, protect: pass, network: network));
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    func getListContact(){
        listcontact.append(ContactViewModel(data: contact!))
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
    func getListLocation(){
          listlocation.append(LocationViewModel(data: location!))
          responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
      }
    func getListMessage(){
            listmessage.append(MessageViewModel(data: message!))
            responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
        }
    func getListEvent(){
        listevent.append(EventViewModel(data: event!))
        responseToView!(EnumResponseToView.UPDATE_DATA_SOURCE.rawValue)
    }
}
