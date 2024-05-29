//
//  CapsuleImage.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 24/05/24.
//

import Foundation
import UIKit

class CapsuleImage: UIImageView {

    override func layoutSubviews() {

        super.layoutSubviews()

        let height = bounds.height

        layer.cornerRadius = height/2

      }

}
