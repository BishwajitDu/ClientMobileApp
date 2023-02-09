//
//  ContentInfoCell.swift
//  TestProject
//
//  Created by D, Bishwajit (Consumer Servicing & Engagement) on 09/02/23.
//

import UIKit

class ContentInfoCell: UITableViewCell {

	@IBOutlet private weak var headerName: UILabel!
	@IBOutlet private weak var contentInfo: UILabel!
	@IBOutlet private weak var backgroundCOntentView: UIView!

	func bindCellData(header : String, contentInfostr : String) {
		headerName.text = header
		contentInfo.text = contentInfostr
		backgroundCOntentView.layer.cornerRadius = 5.0
		backgroundCOntentView.layer.masksToBounds = false
		backgroundCOntentView.layer.shadowColor = UIColor.gray.cgColor
		backgroundCOntentView.layer.shadowOpacity = 10.0
		backgroundCOntentView.layer.shadowOffset = .zero
		backgroundCOntentView.layer.shadowRadius = 5
		backgroundCOntentView.layer.shouldRasterize = true
		backgroundCOntentView.layer.rasterizationScale = UIScreen.main.scale
	}
}
