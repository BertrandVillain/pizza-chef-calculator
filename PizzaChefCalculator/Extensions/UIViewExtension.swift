//
//  UIViewExtension.swift
//  PizzaChefCalculator
//
//  Created by bertrand villain on 19/01/2021.
//  Copyright © 2021 bertrand villain. All rights reserved.
//

import UIKit

extension UIView {
  
  @IBInspectable var cornerRadius: CGFloat {
    set {
      self.layer.cornerRadius = newValue
      setNeedsLayout()
    }
    get {
      return self.layer.cornerRadius
    }
  }
  
  func applyGradient(colors: [UIColor], horizontal: Bool) {
    var gradientLayer = CAGradientLayer(layer: layer)
    if let tmpLayer = layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer {
      gradientLayer = tmpLayer
    } else {
      self.layer.addSublayer(gradientLayer)
    }
    gradientLayer.colors = colors.compactMap({ $0.cgColor })
    if horizontal {
      gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
      gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
    } else {
      gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
      gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
    }
    
  }
  
}
