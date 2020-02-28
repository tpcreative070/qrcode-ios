//
//  BaseViewController.swift
//  screenrecorder
//
//  Created by phong070 on 2/10/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let didRecieveUnauthorized = Notification.Name("didRecieveUnauthorized")
    static let didRequestApi = Notification.Name("didRequestApi")
}

class BaseViewController: UIViewController {
    var keyboardHelper: KeyboardHelper?
    var isAuto : Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleUnauthorized), name: .didRecieveUnauthorized, object: nil)
        registerEventBus()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    func registerEventBus(){
        SwiftEventBusHelper.onMainThread(self, name:ConfigKey.DismissView) { result in
            self.closeTransaction()
        }

        SwiftEventBusHelper.onMainThread(self, name:ConfigKey.RequestCheckAvailableNotification) { result in
            self.requestCheckAvailableNotification()
        }

        SwiftEventBusHelper.onMainThread(self, name:ConfigKey.RequestNavigationNotificationHistory) { result in
            self.requestNavigationToNotificationHistory()
        }

        SwiftEventBusHelper.onMainThread(self, name: ConfigKey.RequestSaveToPhotos) { (result) in
            let mResult = result?.object as! String
        }
        SwiftEventBusHelper.onMainThread(self, name: ConfigKey.ActionToView) { (result) in
            let mResult = result?.object as! String
            self.updateActionToView(data: mResult)
        }
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
    }

    func doDismiss(){
        view.endEditing(true)
    }

    @objc func requestCheckAvailableNotification(){

    }

    @objc func requestNavigationToNotificationHistory(){
       
    }

    @objc func dismissViewEventBus(){
        SwiftEventBusHelper.postToMainThread(ConfigKey.DismissView)
    }

    @objc func handleUnauthorized() {
        DispatchQueue.main.async {
            debugPrint("Need to re sigin in")
            //GlobalRequestApiHelper.shared.doReSignIn()
            // self.onDoAlertExpiredSession()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: .didRecieveUnauthorized, object: nil)
        if isBeingDismissed{
            SwiftEventBusHelper.unregister(self)
            closeViewController()
        }
    }

    @objc func closeTransaction(){

    }

    @objc func requestUpdateeDong(){

    }

    @objc func updateActionToView(data : String){

    }

    @objc func requestSaveToPho(image : UIImage){

    }

    @objc func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }

    @objc func closeViewController(){
    }

    @objc func log(message : String){
        Utils.logMessage(message: message)
    }

    @objc func log(object : Any){
        Utils.logMessage(object:object)
    }

    func addCloseRightBlackButton(){
        let navButton = Helper.addCloseBlackButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }

    func addCloseLeftBlackButton(){
        let navButton = Helper.addCloseLeftBlackButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }

    func addCloseLeftWhiteButton(){
        let navButton = Helper.addCloseLeftWhiteButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }

    func addLeftBackButton(){
        let navButton = Helper.addLeftBackButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }

    func addLeftBackGrayButton(){
        let navButton = Helper.addLeftBackGrayButton(self.view)
        self.view.bringSubviewToFront(navButton!)
        navButton?.addTarget(self, action: #selector(closeButtonPress), for: .touchUpInside)
    }

    func addButtonCustom(image : UIImage, isLeft : Bool){
        let navButton = Helper.addButtonCustom(self.view, isLeft: isLeft, image: image)
        self.view.bringSubviewToFront(navButton!)
        if isLeft {
            navButton?.addTarget(self, action: #selector(actionLeft), for: .touchUpInside)
        }else{
            navButton?.addTarget(self, action: #selector(actionRight), for: .touchUpInside)
        }
    }

    func addButtonSpecialCustom(image : UIImage, isLeft : Bool) -> UIButton?{
        let navButton = Helper.addButtonCustom(self.view, isLeft: isLeft, image: image)
        self.view.bringSubviewToFront(navButton!)
        if isLeft {
            navButton?.addTarget(self, action: #selector(actionLeft), for: .touchUpInside)
        }else{
            navButton?.addTarget(self, action: #selector(actionRight), for: .touchUpInside)
        }
        return navButton
    }

    func addButtonSpecialCustom(text : String, isLeft : Bool) -> UIButton?{
          let navButton = Helper.addButtonCustom(self.view, isLeft: isLeft, text: text)
          self.view.bringSubviewToFront(navButton!)
          if isLeft {
              navButton?.addTarget(self, action: #selector(actionLeft), for: .touchUpInside)
          }else{
              navButton?.addTarget(self, action: #selector(actionRight), for: .touchUpInside)
          }
          return navButton
    }


    @objc func actionLeft(){

    }

    @objc func actionRight(){

    }

    @objc func closeButtonPress(){

    }

    @objc func isSignInViewController() -> Bool {
        return false
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .default
    }

    func addBackgroundStatusBar(){
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = AppColors.BLUE
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
    }

    func refreshToken(){
     
    }

    func onDoAlertExpiredSession(){
        let alertController = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Error), message: LanguageHelper.getTranslationByKey(LanguageKey.SessionExpried), preferredStyle: .alert)
        let okAction = UIAlertAction(title:  LanguageHelper.getTranslationByKey(LanguageKey.SignIn), style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
        }
        let cancelAction = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Cancel), style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    func onAlertComingSoon(){
        let alertController = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message: LanguageHelper.getTranslationByKey(LanguageKey.ThisFeatureComingSoon), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Ok Pressed")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func onAlertMessage(value : String){
        let alertController = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message: value, preferredStyle: .alert)
        let okAction = UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Ok), style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Ok Pressed")
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func shareFile(images : [UIImage]){
        let shareAll = images
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }

    func doAlertMessage(permission : String){
        let message = String(format: LanguageHelper.getTranslationByKey(LanguageKey.AskPermissionAlert) ?? "", arguments: [permission])
        let alert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.AskPermission), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Yes), style: UIAlertAction.Style.default, handler: { action in
            self.actionAlertYes()
        }))
        alert.addAction(UIAlertAction(title: LanguageKey.No, style: UIAlertAction.Style.cancel, handler: { action in
            self.actionAlertNo()
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    func doAlertMessage(message : String){
        let alert = UIAlertController(title: LanguageHelper.getTranslationByKey(LanguageKey.Alert), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: LanguageHelper.getTranslationByKey(LanguageKey.Yes), style: UIAlertAction.Style.default, handler: { action in
            self.actionAlertYes()
        }))
        alert.addAction(UIAlertAction(title:  LanguageHelper.getTranslationByKey(LanguageKey.No), style: UIAlertAction.Style.cancel, handler: { action in
            self.actionAlertNo()
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }

    @objc func actionAlertYes(){

    }

    @objc func actionAlertNo(){

    }
}
