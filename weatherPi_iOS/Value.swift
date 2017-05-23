//
//  Value.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class Value: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let currentValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private let minValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private let maxValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    private let valueTypeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "wea-temp")
        //imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupView() {
        layer.borderColor = UIColor.orange.cgColor
        layer.borderWidth = 1
        
        addSubview(currentValueLabel)
        addSubview(minValueLabel)
        addSubview(maxValueLabel)
        
        //addSubview(valueTypeIcon)

    }
    
    private func setupConstraints() {
        currentValueLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 5.0).isActive = true
        currentValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        minValueLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5.0).isActive = true
        minValueLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -10.0).isActive = true
        
        maxValueLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5.0).isActive = true
        maxValueLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: 10.0).isActive = true
        
        //valueTypeIcon.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        //valueTypeIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setCurrentvalueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 24)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        currentValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setMinValueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 14)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        minValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setMaxValueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 14)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        maxValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 100)
    }
    
}
