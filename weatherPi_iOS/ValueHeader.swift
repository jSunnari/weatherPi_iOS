//
//  ValueHeader.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class ValueHeader: UIView {
    private let gradient: CAGradientLayer = CAGradientLayer()

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
        label.sizeToFit()
        return label
    }()
    
    func setupView() {
        // Background gradient:
        gradient.colors = [UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.4).cgColor, UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.6).cgColor, UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.4).cgColor]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        layer.insertSublayer(gradient, at: 0)

        // Debug
        layer.borderWidth = 2
        layer.borderColor = UIColor.cyan.cgColor
        
        addSubview(headerLabel)

    }
    
    func setupConstraints() {
        headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: -5.0).isActive = true
    }
    
    func setHeaderLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 14)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        headerLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    override func layoutSubviews() {
        gradient.frame = bounds
        setupConstraints()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 45)
    }
    

    
}
