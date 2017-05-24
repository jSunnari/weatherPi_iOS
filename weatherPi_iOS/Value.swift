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
        return imageView
    }()
    
    private let minValueIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "arr-vertical-down")
        return imageView
    }()
    
    private let maxValueIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "arr-vertical-up")
        return imageView
    }()
    
    private let trendIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let separator: UIView = {
        let separatorView = UIView()
        
        let separatorGradient: CAGradientLayer = CAGradientLayer()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorGradient.colors = [UIColor.clear.cgColor, UIColor(red:0.00, green:0.00, blue:0.00, alpha:0.3).cgColor, UIColor.clear.cgColor]
        separatorGradient.locations = [0.0, 0.5, 1.0]
        separatorGradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        separatorGradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        separatorView.layer.insertSublayer(separatorGradient, at: 0)

        return separatorView
    }()
    
    private func setupView() {
        addSubview(currentValueLabel)
        addSubview(minValueLabel)
        addSubview(maxValueLabel)

        addSubview(valueTypeIcon)
        addSubview(minValueIcon)
        addSubview(maxValueIcon)
        addSubview(trendIcon)
        
        addSubview(separator)
    }
    
    private func setupConstraints() {
        currentValueLabel.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        currentValueLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        minValueLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5.0).isActive = true
        minValueLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: -15.0).isActive = true
        
        maxValueLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: 5.0).isActive = true
        maxValueLabel.leftAnchor.constraint(equalTo: centerXAnchor, constant: 15.0).isActive = true
        
        valueTypeIcon.leftAnchor.constraint(equalTo: leftAnchor, constant: 10.0).isActive = true
        valueTypeIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        minValueIcon.rightAnchor.constraint(equalTo: minValueLabel.leftAnchor, constant: 5.0).isActive = true
        minValueIcon.centerYAnchor.constraint(equalTo: minValueLabel.centerYAnchor).isActive = true
        
        maxValueIcon.rightAnchor.constraint(equalTo: maxValueLabel.leftAnchor, constant: 5.0).isActive = true
        maxValueIcon.centerYAnchor.constraint(equalTo: maxValueLabel.centerYAnchor).isActive = true
        
        trendIcon.rightAnchor.constraint(equalTo: rightAnchor, constant: -10.0).isActive = true
        trendIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        separator.topAnchor.constraint(equalTo: bottomAnchor, constant: -1.0).isActive = true
        separator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        separator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        separator.layer.sublayers?[0].frame = separator.bounds
    }
    
    func setCurrentvalueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 26)!, NSForegroundColorAttributeName: UIColor.white, NSKernAttributeName: 2.0]
        currentValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setMinValueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 17)!, NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7), NSKernAttributeName: 2.0]
        minValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setMaxValueLabel(text: String) {
        let attributes: [String : Any] = [NSFontAttributeName: UIFont(name: "OpenSans", size: 17)!, NSForegroundColorAttributeName: UIColor.white.withAlphaComponent(0.7), NSKernAttributeName: 2.0]
        maxValueLabel.attributedText = NSAttributedString(string: text, attributes: attributes)
    }
    
    func setValueIcon(valueIcon: UIImage) {
        valueTypeIcon.image = valueIcon
    }
    
    func setTrendArrow(direction: String) {
        trendIcon.image = UIImage(named: direction)
    }
    
    override func layoutSubviews() {
        setupConstraints()
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIViewNoIntrinsicMetric, height: 100)
    }
    
}
