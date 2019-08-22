//
//  PreferencesViewController.swift
//
//  Moped - A general purpose text editor, small and light.
//  Copyright © 2019 Roberto Machorro. All rights reserved.
//
//	This program is free software: you can redistribute it and/or modify
//	it under the terms of the GNU General Public License as published by
//	the Free Software Foundation, either version 3 of the License, or
//	(at your option) any later version.
//
//	This program is distributed in the hope that it will be useful,
//	but WITHOUT ANY WARRANTY; without even the implied warranty of
//	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//	GNU General Public License for more details.
//
//	You should have received a copy of the GNU General Public License
//	along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

import Cocoa
import Highlightr

class PreferencesViewController: NSViewController {

	@IBOutlet weak var languages: NSPopUpButton!
	@IBOutlet weak var themes: NSPopUpButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Preferences"

		let highlightrTextStorage = CodeAttributedString()
		languages.removeAllItems()
		languages.addItems(withTitles: highlightrTextStorage.highlightr.supportedLanguages().sorted())
		languages.selectItem(withTitle: UserDefaults.standard.string(forKey: "defaultLanguage") ?? "plaintext")

		themes.removeAllItems()
		themes.addItems(withTitles: highlightrTextStorage.highlightr.availableThemes().sorted())
		themes.selectItem(withTitle: UserDefaults.standard.string(forKey: "defaultTheme") ?? "xcode")
	}

	override func viewDidAppear() {
		super.viewDidAppear()
		view.window?.styleMask.remove(.resizable)
	}

	@IBAction func actionOK(_ sender: Any) {
		// FIXME: Preferences should be handled with a Model
		UserDefaults.standard.set(languages.titleOfSelectedItem ?? "plaintext", forKey: "defaultLanguage")
		UserDefaults.standard.set(themes.titleOfSelectedItem ?? "xcode", forKey: "defaultTheme")
		view.window?.close()
	}

}