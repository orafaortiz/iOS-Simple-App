//
//  MenuCellViewModel.swift
//  FrameworkTest
//
//  Created by Rafael Ortiz on 22/02/22.
//

import UIKit
import CoreData

struct MenuCellViewModel {
    
    var onSelect: (MainMenuItems) -> Void = { _ in }
    
    var title: MainMenuItems
    
    init (_ title: MainMenuItems) {
        self.title = title
    }
    
    func didSelect() {
        
        onSelect(title)
    }
}
