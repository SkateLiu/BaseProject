//
//  PlaceholderTextView.swift
//  SinoFI
//
//  Created by 刘 强 on 2017/2/21.
//  Copyright © 2017年 刘 强. All rights reserved.
//

import UIKit

class PlaceholderTextView: UITextView {
    
    var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
            updatePlaceholderLabelSize()
        }
    }
    var placeholderColor: UIColor? {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    override var font: UIFont? {
        willSet {
            super.font = font
            placeholderLabel.font = newValue
            updatePlaceholderLabelSize()
        }
    }
    
    override var text: String? {
        willSet {
            super.text = text
            textDidChange()
        }
    }
    
    override var attributedText: NSAttributedString? {
        willSet {
            super.attributedText = attributedText
            textDidChange()
        }
    }
    
    private lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.frame.origin.x = 4
        label.frame.origin.y = 7
        return label
        }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        
        alwaysBounceVertical = true
        font = UIFont.systemFont(ofSize: 14)
        placeholderColor = UIColor.gray
        placeholderLabel.alpha = 0.6

        NotificationCenter.default.addObserver(self, selector: #selector(PlaceholderTextView.textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func textDidChange() {
        self.placeholderLabel.isHidden = hasText
    }
    
    func updatePlaceholderLabelSize() {
        let maxSize = CGSize(width: bounds.size.width - 2 * placeholderLabel.frame.origin.x,height: 100000)
        if placeholder != nil {
        placeholderLabel.frame.size = (placeholder! as NSString).boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName : placeholderLabel.font as AnyObject], context: nil).size
            placeholderLabel.backgroundColor = UIColor.clear
        }
    }
}
