//
//  UiUtils.swift
//  Test
//

import Foundation
import UIKit

class UiUtils {
    

    static func showDefaultAlertView(withTitle title: String?, message: String?, completion: (() -> Void)? = nil) {
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
            completion?()}))
        rootViewController?.present(alertController, animated: true)
    }
    
    /// Method to get object of view controller
    /// - Parameters:
    ///   - name: Denotes view controller name
    ///   - vcType: Denotes viewController data type
    /// - Returns: Returns view controller object
    static func getViewController<T: UIViewController>(viewController: T.Type, isFromSameStoryBoard: Bool = false) -> T? {
        let viewControllerObj = getStoryboardInstance().instantiateViewController(withIdentifier: String(describing:  viewController.self)) as? T
        return viewControllerObj
    }
    
    /// Setting StoryBoardName
    /// - Returns: UIStoryBoard Name
    static func getStoryboardInstance() -> UIStoryboard {
        return UIStoryboard.init(name:"Main",bundle: nil)
    }
}

