//
//  ContentOptionCell.swift
//  TestProject
//
//  Created by D, Bishwajit (Consumer Servicing & Engagement) on 08/02/23.
//

import UIKit

class ContentOptionCell: UITableViewCell {
	
	// Test of the items need to be added later

	@IBOutlet private weak var headerName: UILabel!
	@IBOutlet private weak var cellBackgroundView: UIView!
	@IBOutlet private weak var mailBtn : UIButton!
	@IBOutlet private weak var downloadBtn : UIButton!
	@IBOutlet private weak var viewBtn : UIButton!
	
	func bindCellData(header : String, contentItemNumber : Int) {
		headerName.text = header
		viewBtn.tag = (contentItemNumber * 10) + 1
		downloadBtn.tag = (contentItemNumber * 10) + 2
		mailBtn.tag = (contentItemNumber * 10) + 3
		cellBackgroundView.layer.cornerRadius = 5.0
		cellBackgroundView.layer.masksToBounds = false
		cellBackgroundView.layer.shadowColor = UIColor.gray.cgColor
		cellBackgroundView.layer.shadowOpacity = 10.0
		cellBackgroundView.layer.shadowOffset = .zero
		cellBackgroundView.layer.shadowRadius = 5
		cellBackgroundView.layer.shouldRasterize = true
		cellBackgroundView.layer.rasterizationScale = UIScreen.main.scale
	}
	
	@IBAction func buttonAction(_ sender: UIButton) {
		// TODO: add the actions
		print(sender.tag)
	}
}
