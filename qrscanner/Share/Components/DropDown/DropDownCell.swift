//
//  DropDownCell.swift
//  qrscanner
//
//  Created by Mac10 on 4/4/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
open class DropDownCell: UITableViewCell {
    var selectedBackgroundColor: UIColor?
    var highlightTextColor: UIColor?
    var normalTextColor: UIColor?
    var identifier =  EnumIdentifier.None
    lazy var optionLabel : ICLabel = {
        let view = ICLabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let viewBackground : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func configView(){
        self.optionLabel.text = "43"
    }
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if reuseIdentifier == EnumIdentifier.Dropdown.rawValue {
            identifier = EnumIdentifier.Dropdown
        }
        setupView()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: - UI

extension DropDownCell {
    func setupView(){
        backgroundColor = .clear
        self.addSubview(self.viewBackground)
        NSLayoutConstraint.activate([
            self.viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.viewBackground.addSubview(optionLabel)
        NSLayoutConstraint.activate([
            self.optionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.optionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.optionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.optionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }
    override open var isSelected: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override open var isHighlighted: Bool {
        willSet {
            setSelected(newValue, animated: false)
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        setSelected(highlighted, animated: animated)
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) {
        let executeSelection: () -> Void = { [weak self] in
            guard let `self` = self else { return }
            
            if let selectedBackgroundColor = self.selectedBackgroundColor {
                if selected {
                    self.backgroundColor = selectedBackgroundColor
                    self.optionLabel.textColor = self.highlightTextColor
                } else {
                    self.backgroundColor = .clear
                    self.optionLabel.textColor = self.normalTextColor
                }
            }
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                executeSelection()
            })
        } else {
            executeSelection()
        }
        
        accessibilityTraits = selected ? .selected : .none
    }
    
}
