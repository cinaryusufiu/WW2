//
//  Extension.swift
//  WW2
//
//  Created by Yusuf Çınar on 9.01.2019.
//  Copyright © 2019 Yusuf Çınar. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func toInt() -> Int {
        return Int(self) ?? 0
    }
    func writeToFile() {
        let fileName = "Created"
        
        guard let dir = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return
        }
        
        let fileUrl = dir.appendingPathComponent(fileName)
        guard let data = self.data(using: .utf8) else {
            return
        }
        
        guard FileManager.default.fileExists(atPath: fileUrl.path) else {
            try? data.write(to: fileUrl, options: .atomic)
            return
        }
        
        if let fileHandle = try? FileHandle(forUpdating: fileUrl) {
            fileHandle.seekToEndOfFile()
            fileHandle.write(data)
            fileHandle.closeFile()
        }
    }
}


extension UIView {
    
    func anchor(top : NSLayoutYAxisAnchor?  , left : NSLayoutXAxisAnchor? , bottom :  NSLayoutYAxisAnchor? , right : NSLayoutXAxisAnchor?, paddingTop :  CGFloat , paddingleft : CGFloat , paddingBottom :  CGFloat , paddingRight : CGFloat , width : CGFloat  , height : CGFloat, centerX : NSLayoutXAxisAnchor?, centerY : NSLayoutYAxisAnchor?)  {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingleft).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if width != 0  {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
    }
    
}


