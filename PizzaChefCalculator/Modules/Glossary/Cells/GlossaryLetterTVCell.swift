//
//  GlossaryLetterTVCell.swift
//  PizzaChefCalculator
//
//  Created by bertrand villain on 19/01/2021.
//  Copyright © 2021 bertrand villain. All rights reserved.
//

import UIKit

class GlossaryLetterTVCell: UITableViewCell, AilTableViewCell {
  
  @IBOutlet weak var letterLabel: UILabel!
  @IBOutlet weak var gradientView: GradientView!
  
  weak var source: GlossaryLetterDataSource?
  
  func loadData(_ source: AilCellDataSource, indexPath: IndexPath) {
    guard let source = source as? GlossaryLetterDataSource else { return }
    self.source = source
    letterLabel.text = source.letter
    gradientView.isHidden = !source.selected
    letterLabel.textColor = source.selected ? .white : .darkGray
    self.isSelected = source.selected
  }
 
}

class GlossaryLetterDataSource: AilCellDataSource {
  
  var cellReuseIdentifier: String? { return "GlossaryLetterTVCell" }
  let letter: String
  var selected: Bool

  internal init(letter: String, selected: Bool) {
    self.letter = letter
    self.selected = selected
  }

}
