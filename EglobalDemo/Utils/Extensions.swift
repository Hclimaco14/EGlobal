//
//  Extensions.swift
//  ClimacMovies
//
//  Created by Hector Climaco on 11/02/23.
//

import UIKit
import CommonCrypto

public extension String{
    
    func aes128Encrypt() -> String {
        if !self.isEmpty {
            var keyData:NSData?
            
            keyData = SessionManager.AESencryptKey.data(using: String.Encoding.utf8) as NSData?
        
            
            let data = self.data(using: String.Encoding.utf8) as NSData?
            
            if let data = data , let keyData = keyData {
                
                let cryptData = NSMutableData(length: Int(data.length) + kCCBlockSizeAES128)!
                let keyLength              = size_t(kCCKeySizeAES128)
                let operation: CCOperation = UInt32(kCCEncrypt)
                let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmAES128)
                let options:   CCOptions   = UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding)
                
                var numBytesEncrypted :size_t = 0
                
                let cryptStatus = CCCrypt(operation,
                                            algoritm,
                                            options,
                                            keyData.bytes,
                                            keyLength,
                                            nil,
                                            data.bytes,
                                            (data.length),
                                            cryptData.mutableBytes,
                                            cryptData.length,
                                            &numBytesEncrypted)
                
                if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                    cryptData.length = Int(numBytesEncrypted)
                    let base64cryptString = cryptData.base64EncodedString(options: .endLineWithCarriageReturn)
                    return base64cryptString
                }
                else {
                    return self
                }
            }
            else {
                return self
            }
        }
        else {
            return self
        }
    }
       
    func aes128Decrypt() -> String {
        if !self.isEmpty {
            var keyData:NSData?
            
            keyData = SessionManager.AESencryptKey.data(using: String.Encoding.utf8) as NSData?
            
            
            let data = NSData(base64Encoded: self, options: .ignoreUnknownCharacters) as NSData?
            
            if let data = data , let keyData = keyData {
                let cryptData2 = NSMutableData(length: Int(data.length) + kCCBlockSizeAES128)!
                
                let keyLength              = size_t(kCCKeySizeAES128)
                let operation: CCOperation = UInt32(kCCDecrypt)
                let algoritm:  CCAlgorithm = UInt32(kCCAlgorithmAES128)
                let options:   CCOptions   = UInt32(kCCOptionECBMode + kCCOptionPKCS7Padding)
                
                var numBytesEncrypted :size_t = 0
                
                let cryptStatus = CCCrypt(operation,
                                            algoritm,
                                            options,
                                            keyData.bytes,
                                            keyLength,
                                            nil,
                                            data.bytes,
                                            data.length,
                                            cryptData2.mutableBytes,
                                            cryptData2.length,
                                            &numBytesEncrypted)
                
                if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                    cryptData2.length = Int(numBytesEncrypted)
                    let unencryptedMessage = String(data: cryptData2 as Data, encoding:String.Encoding.isoLatin1)
                    return unencryptedMessage ?? self
                }
                else {
                    return self
                }
            }
            else {
                return self
            }
        }
        else {
            return self
        }
    }
  
}

public extension Optional where Wrapped == String {
    var isNilOrEmpty: Bool {
        guard let str = self?.trimmingCharacters(in: .whitespacesAndNewlines)
                                                else { return true }
        return str == "" ? true : false
    }
}

public extension UIView {
  
  @discardableResult
  func applyGradient(colours: [UIColor]) -> CAGradientLayer {
    return self.applyGradient(colours: colours, locations: nil)
  }
  
  @discardableResult
  func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> CAGradientLayer {
    let gradient: CAGradientLayer = CAGradientLayer()
    gradient.frame = self.bounds
    gradient.colors = colours.map { $0.cgColor }
    gradient.locations = locations
    self.layer.insertSublayer(gradient, at: 0)
    return gradient
  }
  
}

public extension Encodable {
    func toData() -> Data? {
        let enconder = JSONEncoder()
        guard let data = try? enconder.encode(self) else { return nil }
        return data
        
    }
}

public extension UIViewController {
    func presentSingleAlert(title: String?, message: String?, textAction: String = "OK" ){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

                // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel) {
                    UIAlertAction in
                    NSLog("\(textAction) Pressed")
                }
                alertController.addAction(okAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
