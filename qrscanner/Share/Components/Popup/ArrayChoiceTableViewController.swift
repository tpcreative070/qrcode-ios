// Copyright 2018, Ralf Ebert
// License   https://opensource.org/licenses/MIT
// License   https://creativecommons.org/publicdomain/zero/1.0/
// Source    https://www.ralfebert.de/ios-examples/uikit/choicepopover/

import UIKit

class ArrayChoiceTableViewController<Element> : UITableViewController {
    
    typealias SelectionHandler = (Element) -> Void
    typealias LabelProvider = (Element) -> String
    
    private let values : [Element]
    private let labels : LabelProvider
    private let onSelect : SelectionHandler?
    
    init(_ values : [Element], labels : @escaping LabelProvider = String.init(describing:), onSelect : SelectionHandler? = nil) {
        self.values = values
        self.onSelect = onSelect
        self.labels = labels
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = setTextLabel(mString: labels(values[indexPath.row]))
        cell.textLabel?.font = DeviceHelper.isIpad() ? AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_TITLE_FONT_SIZE) : AppFonts.moderateScale(fontName: AppFonts.SFranciscoRegular, size: AppFonts.LABEL_FONT_SIZE)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true)
        onSelect?(values[indexPath.row])
    }
    func setTextLabel(mString: String) -> String{
           if mString == BarcodeType.EAN_8.rawValue{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8) ?? "EAN 8"
           }
           else if mString == BarcodeType.EAN_13.rawValue{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_13) ?? "EAN 13"
           }
           else{
               return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8) ?? "EAN 8"
           }
       }
}
