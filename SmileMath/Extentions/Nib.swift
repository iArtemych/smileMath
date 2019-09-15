//
//  Nib.swift
//  SmileMath
//
//  Created by Artem Chursin on 12/09/2019.
//  Copyright © 2019 Artem Chursin. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView >() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)! [0] as! T
    }
}
