//
//  SaveVC.swift
//  qrscanner
//
//  Created by phong070 on 2/29/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import Floaty
class SaveVC : UIViewController,UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    lazy var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
       scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
     }()
    let wrapperView: UIView = {
      let parentView = UIView()
      parentView.translatesAutoresizingMaskIntoConstraints = false
      return parentView
    }()
        var tableView : UITableView!
        lazy var lbTittle : ICLabel = {
          let lbTittle = ICLabel()
          lbTittle.translatesAutoresizingMaskIntoConstraints = false
          return lbTittle
        }()
    lazy var endedUpScrollViewContainerView : UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      return view
    }()
        var dataSource :TableViewDataSource<TableViewCell,ListQRCodeViewModel,HeaderView>!
        var sections = [TableSection<String, ListQRCodeViewModel>]()
        let viewModel = ScannersViewModelList()
    var floaty = Floaty()

        override func viewDidLoad() {
            super.viewDidLoad()

            initUI()
            setupFloatButton()
            self.sections = TableSection.group(rowItems: self.viewModel.listSave, by: { (headline) in
                return headline.typeCode
            })
            bindViewModel()
     
        }
   
    func setupFloatButton(){
        let item = FloatyItem()
        item.hasShadow = false
        item.buttonColor = AppColors.PRIMARY_COLOR
      
    item.titleLabelPosition = .left
        item.icon = UIImage(named: "ic_keyboard")
        item.icon?.withTintColor(.white)
        item.title = "CVS"
        item.handler = { item in
            let activiController = UIActivityViewController(activityItems: ["this text"], applicationActivities: nil)
            self.present(activiController,animated: true, completion: nil)
        }
        
    //    floaty.hasShadow = false
        
       let item_select = FloatyItem()
            item_select.hasShadow = false
            item_select.buttonColor = AppColors.PRIMARY_COLOR
        
        item_select.titleLabelPosition = .left
            item_select.icon = UIImage(named: "ic_select_all")
            item_select.title = "Select"
            item_select.handler = { item in
               
            }
        floaty.tintColor = .white
    
        floaty.addItem(item: item_select)
        floaty.addItem(item: item)

        floaty.paddingY = self.view.frame.height/6 - floaty.frame.height/2
        self.wrapperView.addSubview(floaty)
        
    }
    // MARK: - Floaty Delegate Methods
       func floatyWillOpen(_ floaty: Floaty) {
           print("Floaty Will Open")
       }
       
       func floatyDidOpen(_ floaty: Floaty) {
           print("Floaty Did Open")
       }
       
       func floatyWillClose(_ floaty: Floaty) {
           print("Floaty Will Close")
       }
       
       func floatyDidClose(_ floaty: Floaty) {
           print("Foaty Did Close")
           }
    
        override func viewDidAppear(_ animated: Bool) {
            
            self.viewModel.doGetListSave()
            self.viewModel.isSelected.value = false
            
        }
        
        
}
