//
//  ComposerTextView.swift
//  PostComposerView
//
//  Created by Alex Takahashi on 11/1/20.
//

import UIKit

class ComposerTextView: UITextView {
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.showsHorizontalScrollIndicator = false
        self.keyboardDismissMode = .onDrag
        self.alwaysBounceVertical = true
        self.font = UIFont.baseFont
        self.layer.cornerRadius = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
