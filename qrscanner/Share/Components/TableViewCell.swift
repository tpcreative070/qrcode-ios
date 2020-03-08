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
//        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewUnderLine : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imgIcon : UIImageView = {
             let view = UIImageView()
             view.translatesAutoresizingMaskIntoConstraints = false
             return view
      }()
  lazy var lbTitle : ICLabel = {
           let view = ICLabel()
           view.translatesAutoresizingMaskIntoConstraints = false
            
           return view
     }()
  /*history*/
    lazy var viewRoot : UIView = {
        let view = UIView()
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
    func configView(view : QRCodeViewModelDeletegate){
        self.lbTypeCode.text = "\(view.typeCodeView)"
        self.lbCreatedDate.text = view.createdDateTimeView
        self.lbContent.text = view.contentView
        self.lbContent.textColor = AppColors.GRAY
        
    }
    //Config with generate
    func configView(viewModel : TypeCodeViewModelDelegate){
        self.lbTitle.text = "\(viewModel.nameView)"
        self.imgIcon.image = UIImage(named: viewModel.imgIconView)
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
        else if reuseIdentifier == EnumIdentifier.Generate.rawValue {
            identifier = EnumIdentifier.Generate
        }
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func actionCellViewTap(sender : UITapGestureRecognizer){
        self.delegate?.cellViewSelected(cell: self)
        if let data = codable {
            self.delegate?.cellViewSelected(cell: data)
        }
        
    
    }
    
    @objc func actionCellViewAction(sender : UITapGestureRecognizer){
        if identifier == EnumIdentifier.Lixi {
            self.delegate?.cellViewSelected(cell: self, action: EnumResponseToView.ACTION_GIFT)
        }
    }
    
    @objc func controlValueChanged(sender : ICStepper){
              self.delegate?.cellViewSelected(cell: self, countSelected: Int(sender.value))
              self.viewModel.maxBinding.value = Int(sender.value)
      }
   
}
