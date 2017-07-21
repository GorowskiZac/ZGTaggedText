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
     
     - Throws: An error of type `ZGTaggedTextError`
     
     - Returns: A `NSMutableAttributedString`, which contains the specified font modifications made to the tagged text.
     */
    func modifyFontWithTags(openingTag: String, closingTag: String, taggedFont: UIFont?, unTaggedFont: UIFont?) throws -> NSMutableAttributedString {
        if self.isEmpty { throw ZGTaggedTextError.EmptyText }
        if !self.contains(openingTag) { throw ZGTaggedTextError.NoOpeningTag }
        if !self.contains(closingTag) { throw ZGTaggedTextError.NoClosingTag }
        guard let taggedTextFont = taggedFont, let untaggedTextFont = unTaggedFont else { throw ZGTaggedTextError.InvalidFont }
        
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


// MARK: Error Handling
enum ZGTaggedTextError: Error {
    case EmptyText
    case NoOpeningTag
    case NoClosingTag
    case InvalidFont
}

extension ZGTaggedTextError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .EmptyText:
            return "ZGTaggedText ERROR: The input text contained no characters."
        case .NoOpeningTag:
            return "ZGTaggedText ERROR: The input text must contain at least one Opening Tag."
        case .NoClosingTag:
            return "ZGTaggedText ERROR: The input text must contain at least one Closing Tag."
        case .InvalidFont:
            return "ZGTaggedText ERROR: The UIFont passed into the function was 'nil'. Make sure the font exists within your project."
        }
    }
}
