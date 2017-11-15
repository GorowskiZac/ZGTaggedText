# ZGTaggedText
Enables simple font modification of specific substrings with the use of marker tags.

## The Problem
It can be difficult and time-consuming to modify specific substrings within a String.

## The Solution
By using ZGTaggedText, all you have to do is put tags around the specific parts of a string you want to modify.

    let taggedTextString = "Before Tags, <tag>Inside Tags,</tag> Outside, <tag>Inside Again!</tag>"
    let tagFont = UIFont(name: "Chalkduster", size: 18.0)
    let normalFont = UIFont(name: "Helvetica Neue", size: 10.0)
    
    textLabel.attributedText = taggedTextString.modifyFontWithTags(openingTag: "<tag>", closingTag: "</tag>", taggedFont: tagFont, unTaggedFont: normalFont)
    
![Modified Text](http://i.imgur.com/B918EXl.png "Modified Text Example")
