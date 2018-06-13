//
//  TypeAliases.swift
//  Fabflix
//
//  Created by Suzie Su Jin Ahn on 6/10/18.
//  Copyright © 2018 Suzie Su Jin Ahn. All rights reserved.
//

import Foundation


typealias  basicWebCall<T : WebCallProtocol>  = (_ Success : Bool, _ Content: T?, _ theError : Error?) -> Void
