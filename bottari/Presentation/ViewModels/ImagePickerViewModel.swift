//
//  ImagePickerViewModel.swift
//  bottari
//
//  Created by 송지혁 on 8/1/24.
//

import SwiftUI
import PhotosUI

class ImagePickerViewModel: ObservableObject {
    @Published var selectedImage: UIImage?
    
    func selectImage(_ result: PHPickerResult) {
        if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                DispatchQueue.main.async {
                    self?.selectedImage = image as? UIImage
                }
            }
        }
    }
}
