//
//  ErrorHelper.swift
//  weatherApp
//
//  Created by Alyson Abril on 8/28/19.
//  Copyright © 2019 Alyson Abril. All rights reserved.
//

import Foundation

enum JSONError:Error {
    case decodingError(Error)
}
