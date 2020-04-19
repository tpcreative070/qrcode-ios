import UIKit

final class TabItemView: UIView {

    private(set) var titleLabel: UILabel = UILabel()
    private(set) var imageIcon: UIImageView = UIImageView()

    public var textColor: UIColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
    public var selectedTextColor: UIColor = AppColors.COLOR_ACCENT

    public var isSelected: Bool = false {
        didSet {
            if isSelected {
                titleLabel.textColor = selectedTextColor
            } else {
                titleLabel.textColor = textColor
            }
        }
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
  
setupImage()
        setupLabel()
    }
    private func setupImage() {
              
          
              addSubview(imageIcon)
             layoutImg()
          }
       private func layoutImg() {

           imageIcon.translatesAutoresizingMaskIntoConstraints = false
        imageIcon.tintColor = AppColors.WHITE_COLOR
           NSLayoutConstraint.activate([
               imageIcon.topAnchor.constraint(equalTo: self.topAnchor,constant: 5),
         
               imageIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//               imageIcon.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: AppConstants.MARGIN_BOTTOM_TAB),
            imageIcon.widthAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SWIPE),
                imageIcon.heightAnchor.constraint(equalToConstant: DeviceHelper.Shared.ICON_SWIPE),
           ])

       }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override public func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupLabel() {
        titleLabel = UILabel(frame: bounds)
        titleLabel.textAlignment = .center
        titleLabel.font = AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: DeviceHelper.Shared.LABEL_FONT_SIZE)
        titleLabel.textColor = UIColor(red: 140/255, green: 140/255, blue: 140/255, alpha: 1.0)
        titleLabel.backgroundColor = UIColor.clear
        addSubview(titleLabel)
        layoutLabel()
    }

    private func layoutLabel() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.imageIcon.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
