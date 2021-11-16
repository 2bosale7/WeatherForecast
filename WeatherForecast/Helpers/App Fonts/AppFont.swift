//
//  AppFont.swift
//  StarterProject
//
//  Created by Mohammed Saleh on 2/4/19.
//  Copyright © 2019 me. All rights reserved.
//

import Foundation
import Foundation
import UIKit

struct AppFont {

    var xLargeSize:UIFont {
        return UIFont(name: JFFlatRegular, size: XLARGETEXT) ?? UIFont.systemFont(ofSize: XLARGETEXT)
    }

    var xLargeBoldSize:UIFont {
        return UIFont(name: JFFlatBold, size: XLARGETEXT) ?? UIFont.systemFont(ofSize: XLARGETEXT)
    }
    
    var largeSize:UIFont {
        return UIFont(name: JFFlatRegular, size: LARGETEXT) ?? UIFont.systemFont(ofSize: LARGETEXT)
    }
    
    var largeBoldSize:UIFont {
        return UIFont(name: JFFlatBold, size: LARGETEXT) ?? UIFont.systemFont(ofSize: LARGETEXT)
    }
    
    var normalSize:UIFont {
        return UIFont(name: JFFlatRegular, size: NORMALSIZE) ?? UIFont.systemFont(ofSize: NORMALSIZE)
    }
    
    var normalBoldSize:UIFont {
        return UIFont(name: JFFlatBold, size: NORMALSIZE) ?? UIFont.systemFont(ofSize: NORMALSIZE)
    }
    
    var smallSize:UIFont {
        return UIFont(name: JFFlatRegular, size: SMALLSIZE) ?? UIFont.systemFont(ofSize: SMALLSIZE)
    }
    
    var smallBoldSize:UIFont {
        return UIFont(name: JFFlatBold, size: SMALLSIZE) ?? UIFont.systemFont(ofSize: SMALLSIZE)
    }
}
