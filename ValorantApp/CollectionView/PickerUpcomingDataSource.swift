//
//  PickerUpcomingDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 16/05/24.
//

import Foundation
import UIKit

class PickerUpcomingDataSource: NSObject, UIPickerViewDataSource{
    
    var matches: [UpcomingSegment]
    
    init(matches: [UpcomingSegment]) {
        self.matches = matches
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return matches.count
    }
    
    
}
