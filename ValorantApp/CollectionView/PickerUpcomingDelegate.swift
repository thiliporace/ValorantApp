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
}
