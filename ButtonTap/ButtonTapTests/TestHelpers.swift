//
//  TestHelpers.swift
//  ButtonTapTests
//
//  Created by ByungHoon Ann on 2023/02/17.
//

import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}
