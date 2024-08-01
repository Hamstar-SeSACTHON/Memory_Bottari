//
//  String+.swift
//  bottari
//
//  Created by 송지혁 on 8/2/24.
//

import UIKit

extension String {
    func toUIImage() -> UIImage? {
        guard let imageData = Data(base64Encoded: self) else { return nil }
        return UIImage(data: imageData)
    }
}
