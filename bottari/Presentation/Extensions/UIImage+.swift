//
//  UIImage+.swift
//  bottari
//
//  Created by 송지혁 on 8/2/24.
//

import UIKit

extension UIImage {
    func toBase64() -> String? {
        guard let imageData = self.pngData() else { return nil }
        return imageData.base64EncodedString(options: .lineLength64Characters)
    }
}
