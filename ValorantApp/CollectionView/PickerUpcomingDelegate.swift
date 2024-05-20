//
//  PickerUpcomingViewDelegate.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 16/05/24.
//

import Foundation
import UIKit

class PickerUpcomingDelegate: NSObject, UIPickerViewDelegate{
    
    var matches: [UpcomingSegment]
    
    init(matches: [UpcomingSegment]) {
        self.matches = matches
    }
    
    func pickerView(_ pickerView: UIPickerView,
                  titleForRow row: Int,
                    forComponent component: Int) -> String?{
        return matches[row].matchEvent
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()

        label.textColor = .mainRed
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center

        label.text = matches[row].matchEvent

        return label
    }
    
    
}
