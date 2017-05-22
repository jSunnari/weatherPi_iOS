//
//  CurrentWeatherView.swift
//  weatherPi_iOS
//
//  Created by Jonas Sunnari on 2017-05-22.
//  Copyright © 2017 Jonas Sunnari. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let testLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "testing"
        return label
    }()
    
    func setupView() {
        let outdoorHeader: ValueHeader = ValueHeader(frame: CGRect(x: 0, y: 65, width: frame.width, height: 40))

        addSubview(outdoorHeader)

        //backgroundColor = UIColor.white
        

        
    }
    
}
