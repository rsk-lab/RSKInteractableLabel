//
// RSKInteractableLabelProtocol.swift
//
// Copyright (c) 2021 R.SK Lab Ltd. All Rights Reserved.
//
// Licensed under the RPL-1.5 and R.SK Lab Professional licenses
// (the "Licenses"); you may not use this work except in compliance
// with the Licenses. You may obtain a copy of the Licenses in
// the LICENSE_RPL and LICENSE_RSK_LAB_PROFESSIONAL files.
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the Licenses is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
// either express or implied.
//

import UIKit

/// The protocol to be adopted by a type of object that represents an interactable label.
public protocol RSKInteractableLabelProtocol {
    
    ///
    /// Returns the index of the character falling under the given point, expressed in the label's coordinate system.
    ///
    /// - Parameters:
    ///     - point: The point to test.
    ///
    /// - Returns: The index of the character falling under point.
    ///
    func characterIndex(for point: CGPoint) -> Int?
}

public extension RSKInteractableLabelProtocol where Self: UILabel {
    
    // MARK: - Public Functions
    
    func characterIndex(for point: CGPoint) -> Int? {
        
        precondition(self.baselineAdjustment == .none, "Only `UIBaselineAdjustment.none` is supported.")
        
        guard self.bounds.contains(point) == true,
              let attributedText = self.attributedText,
              attributedText.length > 0 else {
            
            return nil
        }
        
        let textContainer = NSTextContainer()
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.lineFragmentPadding = 0.0
        textContainer.maximumNumberOfLines = self.numberOfLines
        textContainer.size = CGSize(width: self.bounds.width, height: 0.0)
        
        let layoutManager = NSLayoutManager()
        layoutManager.usesFontLeading = false
        layoutManager.addTextContainer(textContainer)
        
        let textStorage = NSTextStorage()
        textStorage.setAttributedString(attributedText)
        textStorage.addLayoutManager(layoutManager)
        
        _ = layoutManager.glyphRange(for: textContainer)
        
        let usedRect = layoutManager.usedRect(for: textContainer)
        guard usedRect.contains(point) == true else {
            
            return nil
        }
        
        let characterIndex = layoutManager.characterIndex(for: point, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return characterIndex
    }
}
