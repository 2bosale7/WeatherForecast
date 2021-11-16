//
//  ThemeColor.swift
//  StarterProject
//
//  Created by Mohammed Saleh on 2/4/19.
//  Copyright © 2019 me. All rights reserved.
//
import UIKit

/*
 // Usage Examples
 let shadowColor = Color.shadow.value
 let shadowColorWithAlpha = Color.shadow.withAlpha(0.5)
 let customColorWithAlpha = Color.custom(hexString: "#123edd", alpha: 0.25).value
 */

extension CMColor {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
            case .theme:
                instanceColor = CMColor.custom(hexString: MAINTHEME, alpha: 1).value
            case .background:
                instanceColor = CMColor.custom(hexString: BACKGROUND, alpha: 1).value
            case .darkText:
                instanceColor = CMColor.custom(hexString: DARKTEXT, alpha: 1).value
            case .lightText:
                instanceColor = CMColor.custom(hexString: LIGHTTEXT, alpha: 1).value
            case .gearButton:
                instanceColor = CMColor.custom(hexString: GRAYBUTTON, alpha: 1).value
            case .green:
                instanceColor = CMColor.custom(hexString: GREEN, alpha: 1).value
            case .info:
                instanceColor = CMColor.custom(hexString: INFO, alpha: 1).value
            case .chatLightGray:
                instanceColor = CMColor.custom(hexString: CHATLIGHTGRAY, alpha: 1).value
            case .darkGray:
                instanceColor = CMColor.custom(hexString: DARKGRAY, alpha: 1).value
            case .red:
                instanceColor = CMColor.custom(hexString: REDCOLOR, alpha: 1).value
            case .acceptColor:
                instanceColor = CMColor.custom(hexString: ACCEPTCOLOR, alpha: 1).value
            case .returnColor:
                instanceColor = CMColor.custom(hexString: RETURNCOLOR, alpha: 1).value
            case .rejectColor:
                instanceColor = CMColor.custom(hexString: REJECTCOLOR, alpha: 1).value
            case .FinishColor:
                instanceColor = CMColor.custom(hexString: FINISHCOLOR, alpha: 1).value
            case .shadow:
                instanceColor = CMColor.custom(hexString: SHADOWCOLOR, alpha: 0.7).value
            case .custom(let hexValue, let opacity):
                instanceColor = UIColor(hex: hexValue).withAlphaComponent(CGFloat(opacity))
        }
        return instanceColor
    }
    
   
}
