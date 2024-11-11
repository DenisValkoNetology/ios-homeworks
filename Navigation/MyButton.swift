//
//  MyButton.swift
//  Navigation
//
//  Created by Денис Валько on 09.11.2024.
//

import UIKit

class MyButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1.0
            } else {
                self.alpha = 0.8
            }
        }
    }

    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                self.alpha = 0.8
            } else {
                self.alpha = 1.0
            }
        }
    }

    override var isHighlighted: Bool {
        didSet {
            if self.isHighlighted {
                self.alpha = 0.8
            } else {
                self.alpha = 1.0
            }
        }
    }
}
