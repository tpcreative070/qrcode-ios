import UIKit
class BarcodeViewModel : Codable , BarcodeViewModelDelegate{
    var barcodeView: String{
        return barcode ?? ""
    }
    
    var typeBarcodeView: String
    {
        return typeBarcode ?? ""
    }
    var createDateTime: Int?
    var typeCode : String?
    var isSeen : Int? = 0
    var isUpdate: Int?
    
    var barcode: String?
    var typeBarcode: String?
    init(barcode: String, typeBarcode: String) {
        self.barcode = barcode
        self.typeBarcode = typeBarcode
    }
    init(data: BarcodeModel) {
        self.barcode = data.productID
        self.typeBarcode = data.barcodetype
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
