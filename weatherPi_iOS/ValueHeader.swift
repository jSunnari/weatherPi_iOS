//
//  ValueHeader.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class ValueHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 12)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 4.0]
        label.attributedText = NSAttributedString(string: "HeaderText", attributes: attributes)
        label.sizeToFit()
        
        return label
    }()
    
    func setupView() {
        
        addSubview(headerLabel)
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.red.cgColor
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v0]-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": headerLabel]))
    }
}
