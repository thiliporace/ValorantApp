//
//  +UIButton.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 22/05/24.
//

import Foundation
import UIKit

extension UIButton {
    public func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)

        if self.superview is BigFollowingViewCell {   // This ensures that all UIButtons aren't affected
            if context.nextFocusedView == self {
                // Perform actions for when UIButton is focused
            }else {
                // Perform actions for when UIButton loses focus
            }
        }
    }
}
