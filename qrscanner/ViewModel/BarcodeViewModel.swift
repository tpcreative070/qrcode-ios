import UIKit
class BarcodeViewModel : Codable , BarcodeViewModelDelegate{
    var barcodeView: String{
        return productID ?? ""
    }
    
    var typeBarcodeView: String
    {
        return barcodetype ?? ""
    }
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    
    var barcodetype: String?
    var productID: String?
    init(barcodetype: String,productID: String) {
        self.productID = productID
        self.barcodetype = barcodetype
    }
    init(data: BarcodeModel) {
        self.productID = data.productID
        self.barcodetype = data.barcodetype
       }
    init() {
    }
    init(data: ValuePushModel) {
        self.createDateTime = data.createDateTime
        self.typeCode = data.typeCode
        self.isSeen = data.isSeen
        self.isUpdate = data.isUpdate
    }
    
}
