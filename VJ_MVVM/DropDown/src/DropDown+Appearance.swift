//
//  DropDown+Appearance.swift
//  BridgeSales
//
//  Created by Vijay on 12/08/21.
//
import UIKit

extension DropDown {

	public class func setupDefaultAppearance() {
		let appearance = DropDown.appearance()

		appearance.cellHeight = DPDConstant.UI.RowHeight
		appearance.backgroundColor = DPDConstant.UI.BackgroundColor
		appearance.selectionBackgroundColor = DPDConstant.UI.SelectionBackgroundColor
		appearance.separatorColor = DPDConstant.UI.SeparatorColor
        appearance.cornerRadius = DPDConstant.UI.CornerRadius
		appearance.shadowColor = DPDConstant.UI.Shadow.Color
		appearance.animationduration = DPDConstant.Animation.Duration
		appearance.textColor = DPDConstant.UI.TextColor
		appearance.textFont = DPDConstant.UI.TextFont
	}

}