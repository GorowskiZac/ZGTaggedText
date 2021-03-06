//
//  ViewController.swift
//  ZGTaggedText
//
//  Created by Zac Gorowski on 7/21/17.
//  Copyright © 2017 Tetragon Studio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    
    // MARK: - View Loading
    override func viewDidLoad() {
        super.viewDidLoad()
        /* Setup Button Selector */
        updateButton.addTarget(self, action: #selector(updateSelector), for: .touchUpInside)
    }
    
    
    // MARK: - Selectors
    func updateSelector() {
        /* Set Tagged Text & Fonts */
        let taggedTextString = "Before Tags, <tag>Inside Tags,</tag> Outside, <tag>Inside Again!</tag>"
        let tagFont = UIFont(name: "Chalkduster", size: 18.0)
        let normalFont = UIFont(name: "Helvetica Neue", size: 10.0)
        
        /* You can simply assign the AttributedText to the modified String, which may return nil. */
        textLabel.attributedText = taggedTextString.modifyFontWithTags(openingTag: "<tag>", closingTag: "</tag>", taggedFont: tagFont, unTaggedFont: normalFont)
    }
}

