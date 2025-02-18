//
//  Utils.swift
//  Test
//

import Foundation
import UIKit


class Utils {
    
    static var colors_Array = [getColor(red:246, green: 71, blue: 146, alpha: 1),
                               getColor(red:254, green: 105, blue: 198, alpha: 1),
                               getColor(red:255, green: 181, blue: 228, alpha: 1),
                               getColor(red:250, green: 182, blue: 242, alpha: 1),
                              getColor(red:242, green: 112, blue: 231, alpha: 1),
                               getColor(red:225, green: 76, blue: 211, alpha: 1),
                              getColor(red:255, green: 66, blue: 82, alpha: 1),
                               getColor(red:255, green: 102, blue: 122, alpha: 1),
                               getColor(red:255, green: 178, blue: 188, alpha: 1),
                               getColor(red:255, green: 203, blue: 164, alpha: 1),
                               getColor(red:255, green: 152, blue: 82, alpha: 1),
                               getColor(red:255, green: 101, blue: 57, alpha: 1),
                               getColor(red:255, green: 135, blue: 41, alpha: 1),
                               getColor(red:255, green: 195, blue: 59, alpha: 1),
                               getColor(red:255, green: 224, blue: 146, alpha: 1),
                               getColor(red:255, green: 234, blue: 155, alpha: 1),
                               getColor(red:255, green: 214, blue: 71, alpha: 1),
                               getColor(red:255, green: 173, blue: 55, alpha: 1),
                               getColor(red:255, green: 211, blue: 69, alpha: 1),
                               getColor(red:255, green: 232, blue: 85, alpha: 1),
                               getColor(red:255, green: 242, blue: 164, alpha: 1),
                               getColor(red:234, green: 246, blue: 174, alpha: 1),
                               getColor(red:209, green: 238, blue: 100, alpha: 1),
                               getColor(red:162, green: 221, blue: 79, alpha: 1),
                               getColor(red:31, green: 231, blue: 90, alpha: 1),
                               getColor(red:92, green: 243, blue: 117, alpha: 1),
                               getColor(red:176, green: 248, blue: 183, alpha: 1),
                               getColor(red:185, green: 246, blue: 248, alpha: 1),
                               getColor(red:108, green: 237, blue: 240, alpha: 1),
                               getColor(red:46, green: 218, blue: 224, alpha: 1),
                               getColor(red:0, green: 155, blue: 242, alpha: 1),
                               getColor(red:0, green: 206, blue: 248, alpha: 1),
                               getColor(red:128, green: 232, blue: 253, alpha: 1),
                               getColor(red:220, green: 212, blue: 247, alpha: 1),
                               getColor(red:184, green: 173, blue: 241, alpha: 1),
                               getColor(red:109, green: 107, blue: 211, alpha: 1),
                               getColor(red:0, green: 0, blue: 0, alpha: 1)]
    
    static func getColor(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}
