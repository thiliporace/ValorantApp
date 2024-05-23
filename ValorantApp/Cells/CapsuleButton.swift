//
//  CapsuleButton.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 22/05/24.
//

import Foundation
import UIKit

class CapsuleButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = bounds.height
        layer.cornerRadius = height/2
      }
}
