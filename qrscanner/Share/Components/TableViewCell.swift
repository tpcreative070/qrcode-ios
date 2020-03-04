//
//  TableViewCell.swift
//  vietlifetravel
//
//  Created by Mac10 on 7/3/19.
//  Copyright © 2019 Mac10. All rights reserved.
//

import UIKit
class TableViewCell : UITableViewCell{
    var viewModel  = TableViewCellViewModel()
    var delegate : TableViewCellDelegate?
    var identifier =  EnumIdentifier.None
    var codable : Codable?
    let backGroundView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewUnderLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    lazy var control : ICStepper = {
        let view = ICStepper()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.buttonsBackgroundColor = AppColors.GRAY_LIGHT
        view.labelBackgroundColor = AppColors.GRAY_LIGHT
        view.labelTextColor = AppColors.BLACK_COLOR
        view.rightButton.setTitleColor(AppColors.GRAY, for: .normal)
        view.leftButton.setTitleColor(AppColors.GRAY, for: .normal)
        view.minimumValue = 0
        view.maximumValue = 10
        view.addTarget(self, action: #selector(controlValueChanged), for: .valueChanged)
        return view
    }()
  
  /*history*/
    lazy var imgIcon : UIImageView = {
           let view = UIImageView()
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
    }()
       
    
    lazy var lbCreatedDate : ICLabel = {
          let view = ICLabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
    }()
    
    lazy var viewSub : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
      
    lazy var lbContent : ICLabel = {
          let view = ICLabel()
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
    }()
      lazy var lbTypeCode : ICLabel = {
            let view = ICLabel()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
      }()
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //config with history
    func configView(view : ScannerViewModelDeletegate){
        self.lbTypeCode.text = "\(view.typeCode)"
        self.lbCreatedDate.text = view.createdDateTime
        self.lbContent.text = view.content
        self.lbContent.textColor = AppColors.GRAY
        
    }
    
  func configData(viewModel : Codable){
      self.codable = viewModel
  }
    // MARK: - Init
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if reuseIdentifier == EnumIdentifier.History.rawValue {
            identifier = EnumIdentifier.History
        }
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    @objc func controlValueChanged(sender : ICStepper){
              self.delegate?.cellViewSelected(cell: self, countSelected: Int(sender.value))
              self.viewModel.maxBinding.value = Int(sender.value)
      }
   
}
