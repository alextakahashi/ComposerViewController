//
//  UIView+LayoutMargins.swift
//  PostComposerView
//
//  Created by Alex Takahashi on 11/1/20.
//

import UIKit

extension UIView {
    var layoutMarginsHorizontal: CGFloat {
        return layoutMargins.left + layoutMargins.right
    }
    
    var layoutMarginsVertical: CGFloat {
        return layoutMargins.top + layoutMargins.bottom
    }
}
