//
//  UIViewExtension.swift
//  GAN
//
//  Created by Tom on 26/04/2021.
//

import UIKit

extension UIView {
    func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor? = nil,
        paddingTop: CGFloat = 0,
        paddingLeading: CGFloat = 0,
        paddingBottom: CGFloat = 0,
        paddingTrailing: CGFloat = 0,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        centerHorizontal: NSLayoutXAxisAnchor? = nil,
        centerVertical: NSLayoutYAxisAnchor? = nil,
        enableInsets: Bool = false
    ) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)

        if enableInsets {
            if #available(iOS 11.0, *) {
                topInset = safeAreaInsets.top
                bottomInset = safeAreaInsets.bottom
            }
        }

        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop + topInset).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom - bottomInset).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let centerVertical = centerVertical {
            centerYAnchor.constraint(equalTo: centerVertical).isActive = true
        }
        if let centerHorizontal = centerHorizontal {
            centerXAnchor.constraint(equalTo: centerHorizontal).isActive = true
        }
    }
}

