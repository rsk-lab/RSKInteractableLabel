//
// RSKInteractableLabel.swift
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

/// The type of object that represents an interactable label.
open class RSKInteractableLabel: UILabel, RSKInteractableLabelProtocol {
    
    // MARK: - Open Properties
    
    ///
    /// An option that controls whether the text's baseline remains fixed when text needs to shrink to fit in the label.
    ///
    /// - Precondition: Only `UIBaselineAdjustment.none` is supported.
    ///
    open override var baselineAdjustment: UIBaselineAdjustment {
        
        willSet {
            
            precondition(newValue == .none, "Only `UIBaselineAdjustment.none` is supported.")
        }
    }
    
    // MARK: - Public Initializers
    
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.applyIndependentAttributes()
    }
    
    public required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        
        self.applyIndependentAttributes()
    }
    
    // MARK: - Private Functions
    
    private func applyIndependentAttributes() {
        
        self.baselineAdjustment = .none
        self.isUserInteractionEnabled = true
    }
}
