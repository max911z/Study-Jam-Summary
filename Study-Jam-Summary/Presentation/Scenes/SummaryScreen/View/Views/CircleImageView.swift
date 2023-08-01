//
//  CircleImageView.swift
//  Study-Jam-Summary
//
//  Created by Елена on 01.08.2023.
//

import UIKit

class CircleImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.size.height / 2
        self.clipsToBounds = true
    }
}
