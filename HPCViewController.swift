//
//  ViewController.swift
//  TestProject
//
//  Created by D, Bishwajit (Consumer Servicing & Engagement) on 03/02/23.
//

import UIKit
import SnapKit
class HPCViewController: UIViewController {
	
	enum ScreenType {
		case infoMode
		case contentMode
	}
	
	@IBOutlet private weak var contentOptionTableView : UITableView!
	@IBOutlet private weak var imagePlaceHolderView : UIImageView!
	@IBOutlet private weak var loadContentBtnViewHeightConst : NSLayoutConstraint!
	@IBOutlet private weak var loadContentBtnView : UIView!
	
	private var screenMode : ScreenType = .infoMode
	private let loadContentBtnHeight = 50.0
	
	static func getController(screenMode : ScreenType) -> UIViewController {
		let storyboard = UIStoryboard(name: "Main", bundle: nil)
		let viewController = storyboard.instantiateViewController(withIdentifier: "HPCViewController") as! HPCViewController
		viewController.screenMode = screenMode
		return viewController
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	private func setupUI() {
		contentOptionTableView.estimatedRowHeight = 150.0
		switch screenMode {
			case .infoMode:
				loadContentBtnViewHeightConst.constant = loadContentBtnHeight
				loadContentBtnView.isHidden = false
				break
			default:
				loadContentBtnViewHeightConst.constant = 0.0
				loadContentBtnView.isHidden = true
				break
		}
	}
	
	@IBAction func onButtonClick(_ sender: UIButton) {
		if screenMode == .contentMode { return }
		let controller = HPCViewController.getController(screenMode: .contentMode)
		self.navigationController?.pushViewController(controller, animated: true)
	}
}

extension HPCViewController : UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch screenMode {
			case .infoMode:
				if let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as? ContentInfoCell {
					cell.bindCellData(header: "Info \(indexPath.row + 1)", contentInfostr: "Error Domain=NSURLErrorDomain Code=-1200 An SSL error has occurred and a secure connection to the server cannot be made.")
					return cell
				}
				break
			case .contentMode:
				if let cell = tableView.dequeueReusableCell(withIdentifier: "optionCell", for: indexPath) as? ContentOptionCell {
					cell.bindCellData(header: "Content \(indexPath.row + 1)", contentItemNumber: indexPath.row)
					return cell
				}
		}
		
		return UITableViewCell()
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}
}

