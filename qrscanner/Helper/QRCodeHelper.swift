//
//  QRCodeHelper.swift
//  qrscanner
//
//  Created by phong070 on 4/23/20.
//  Copyright © 2020 thanhphong070. All rights reserved.
//

import UIKit
import ZXingObjC
class QRCodeHelper {
    static let shared = QRCodeHelper()
    func generateDataQRCode(from string: String) -> UIImage? {
        do {
            let writer = ZXMultiFormatWriter()
            let hints = ZXEncodeHints() as ZXEncodeHints
            hints.encoding = String.Encoding.utf8.rawValue
            let result = try writer.encode(string, format: kBarcodeFormatQRCode, width: Int32(AppConstants.HEIGHT_IMAGE_QR), height: Int32(AppConstants.HEIGHT_IMAGE_QR), hints: hints)
            if let imageRef = ZXImage.init(matrix: result, on: AppColors.BLACK_COLOR.cgColor, offColor: nil) {
                if let image = imageRef.cgimage {
                    return UIImage.init(cgImage: image)
                }
            }
        }
        catch {
            print(error)
        }
        return nil
    }
    func setTextLabel(mString: String) -> String{
        if mString == BarcodeType.EAN_8.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_8) ?? "EAN 8"
        }
        else if mString == BarcodeType.EAN_13.rawValue{
            return LanguageHelper.getTranslationByKey(LanguageKey.EAN_13) ?? "EAN 13"
        }
//        else if mString == BarcodeType.PDF417.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.PDF417) ?? "PDF417"
//
//        }
//        else if mString == BarcodeType.Aztec.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "Aztec"
//        }
//        else if mString == BarcodeType.UPCE.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.UPCE) ?? "UPCE"
//        }
//        else if mString == BarcodeType.UPCA.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.UPCA) ?? "UPCA"
//        }
//        else if mString == BarcodeType.CODE128.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Code_128) ?? "CODE 128"
//        }
//        else if mString == BarcodeType.CODE93.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Code_93) ?? "CODE 93"
//        }
//        else if mString == BarcodeType.CODE39.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.Aztec) ?? "CODE 39"
//        }
//        else if mString == BarcodeType.ITF.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.ITF) ?? "ITF"
//        }
//        else if mString == BarcodeType.CODABAR.rawValue{
//            return LanguageHelper.getTranslationByKey(LanguageKey.CODABAR) ?? "CODABAR"
//        }
        else{
            return LanguageHelper.getTranslationByKey(LanguageKey.NotFound) ?? "EAN 8"
        }
    }
}
