//
//  AppColors.swift
//  StarterProject
//
//  Created by Mohammed Saleh on 2/4/19.
//  Copyright © 2019 me. All rights reserved.
//
import UIKit

enum CMColor {
    case theme
    case background
    case darkText
    case lightText
    case gearButton
    case green
    case info
    case chatLightGray
    case shadow
    case darkGray
    case red
    case acceptColor
    case returnColor
    case rejectColor
    case FinishColor
    case custom(hexString: String, alpha: Double)
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}
