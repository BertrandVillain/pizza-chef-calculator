//
//  GlossaryPresenter.swift
//  GSE
//
//  Created by Bertrand VILLAIN on 05/01/2021.
//

import UIKit

class GlossaryPresenter {
  
  var viewController: GlossaryViewController!
  
  func loadData() {
    self.fetchGlossary()
    self.loadLetters(stringArray: ["A", "B", "C", "D", "E", "F", "G",
                                   "H", "I", "J", "K", "L", "M", "N",
                                   "O", "P", "Q", "R", "S", "T", "U",
                                   "V", "W", "X", "Y", "Z"])
    
  }
  
  
  func fetchGlossary() {
    
    if let fileUrl = Bundle.main.url(forResource: "glossary_pizzas", withExtension: "json") {
      
      let decoder = JSONDecoder()
      
      do {
        let data = try Data.init(contentsOf: fileUrl)
        let glossaryResponse = try decoder.decode(GlossaryResponse.self, from: data)
        
        let firstSection = glossaryResponse.terms.compactMap({ GlossaryTermDataSource(term: $0) })
        self.viewController.mainDataSource = [firstSection]
        self.viewController.tableView.reloadData()
        
      } catch let e {
        print(e.localizedDescription)
        
      }
      
    }
  }
  
  func loadLetters(stringArray: [String]) {
    self.viewController.indicatorDataSource = [stringArray.compactMap({ GlossaryLetterDataSource(letter: $0, selected: false) })]
  }
  
}
