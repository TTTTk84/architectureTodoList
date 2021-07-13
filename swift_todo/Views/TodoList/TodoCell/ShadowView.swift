//
//  ShadowView.swift
//  swift_todo
//
//  Created by tk84 on 2021/07/11.
//

import UIKit


class ShadowView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }

    private func setupShadow() {
        self.layer.cornerRadius = 10
        self.layer.shadowOffset = CGSize(width: 7.0, height: 7)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.6
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
