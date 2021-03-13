//
//  GlossaryViewController.swift
//  GSE
//
//  Created by Bertrand VILLAIN on 05/01/2021.
//

import UIKit

class GlossaryViewController: UIViewController {

  /// Outlets
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var indicatorTableView: UITableView!
  
  var presenter = GlossaryPresenter()
  var mainDataSource: [[AilCellDataSource]] = [[]]
  var indicatorDataSource: [[AilCellDataSource]] = [[]]

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewController = self
    tableView.dataSource = self
    indicatorTableView.dataSource = self
    indicatorTableView.delegate = self
    self.view.applyGradient(colors: [#colorLiteral(red: 0.9847700347, green: 0.648004841, blue: 0.1351096606, alpha: 0.5029698202), #colorLiteral(red: 0.9847700347, green: 0.7674400206, blue: 0.4871655596, alpha: 0.5007223887)], horizontal: false)
    presenter.loadData()
  }

  /**
    *  This class function makes this class easily instantiable
    */
   class func createInstance() -> GlossaryViewController {
     let storyboard = UIStoryboard(name: "Main", bundle: nil)
     guard let instanceVC = storyboard.instantiateViewController(withIdentifier: "GlossaryViewController") as? GlossaryViewController else {
       fatalError("❌ Cannot instantiate GlossaryViewController")
     }
     instanceVC.presenter.viewController = instanceVC
     return instanceVC
   }
  
}

extension GlossaryViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == self.tableView {
      return mainDataSource[section].count
    } else {
      return indicatorDataSource[section].count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if self.tableView == tableView {
      guard let reuseIdentifier = mainDataSource[indexPath.section][indexPath.row].cellReuseIdentifier,
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? AilTableViewCell else { fatalError("Cannot dequeue cell for indexpath \(indexPath)") }
      cell.loadData(mainDataSource[indexPath.section][indexPath.row], indexPath: indexPath)
      return cell
    } else {
      guard let reuseIdentifier = indicatorDataSource[indexPath.section][indexPath.row].cellReuseIdentifier,
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? AilTableViewCell else { fatalError("Cannot dequeue cell for indexpath \(indexPath)") }
      cell.loadData(indicatorDataSource[indexPath.section][indexPath.row], indexPath: indexPath)
      return cell
    }
  }
  
}

extension GlossaryViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if tableView == self.indicatorTableView {
      (indicatorDataSource[indexPath.section][indexPath.row] as? GlossaryLetterDataSource)?.selected = true
      self.indicatorTableView.reloadRows(at: [indexPath], with: .automatic)
      self.indicatorTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
    }
  }
  
  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    if tableView == self.indicatorTableView {
      (indicatorDataSource[indexPath.section][indexPath.row] as? GlossaryLetterDataSource)?.selected = false
      self.indicatorTableView.reloadRows(at: [indexPath], with: .automatic)
      self.indicatorTableView.deselectRow(at: indexPath, animated: false)
    }
  }
  
}
