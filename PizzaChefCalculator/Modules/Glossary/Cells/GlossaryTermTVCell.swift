//
//  GlossaryTermTVCell.swift
//  GSE
//
//  Created by Bertrand VILLAIN on 05/01/2021.
//

import UIKit

class GlossaryTermTVCell: UITableViewCell, AilTableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var definitionLabel: UILabel!
  
  func loadData(_ source: AilCellDataSource, indexPath: IndexPath) {
    guard let source = source as? GlossaryTermDataSource else { return }
    titleLabel.text = source.term.name
    definitionLabel.text = source.term.definition
  }
  
}

struct GlossaryTermDataSource: AilCellDataSource {
  
  var cellReuseIdentifier: String? { return "GlossaryTermTVCell" }
  let term: Term
  
}
