//
//  ZGTaggedText.swift
//  ZGTaggedText
//
//  Created by Zac Gorowski on 7/21/17.
//  Copyright © 2017 Tetragon Studio. All rights reserved.
//

import UIKit

// MARK: String Extension
extension String {
    /**
     Allows for the modification of substring(s) font with the use of marker tags.
     
     - Parameter openingTag: A `String` containing the opening tag text.
     - Parameter closingTag: A `String` containing the closing tag text.
     - Parameter taggedFont: An optional `UIFont` value to set font attribute of the tagged substring(s).
     - Parameter unTaggedFont: An optional `UIFont` value to set the font attribute of the untagged substring(s).
     
     - Returns: An optional `NSMutableAttributedString`, which contains the specified font modifications made to the tagged text.
     */
    func modifyFontWithTags(openingTag: String, closingTag: String, taggedFont: UIFont?, unTaggedFont: UIFont?) -> NSMutableAttributedString? {
        guard let taggedTextFont = taggedFont,
            let untaggedTextFont = unTaggedFont,
            !self.isEmpty,
            self.contains(openingTag),
            self.contains(closingTag) else { return nil }
        
        let closingTagSplitArray = self.components(separatedBy: closingTag)
        var allTagsSplitArray = [String]()
        for item in closingTagSplitArray {
            if item.contains(openingTag) {
                allTagsSplitArray.append(contentsOf: item.components(separatedBy: openingTag))
            } else {
                allTagsSplitArray.append(item)
            }
        }
        
        let finalAttrStr = NSMutableAttributedString()
        for i in stride(from: 0, to: allTagsSplitArray.count, by: 1) {
            finalAttrStr.append(NSMutableAttributedString(string: allTagsSplitArray[i], attributes: [NSFontAttributeName : i % 2 == 0 ? untaggedTextFont : taggedTextFont]))
        }
        
        return finalAttrStr
    }
}
