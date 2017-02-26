//
//  main.swift
//  closureTest
//
//  Created by Tim Beals on 2017-02-25.
//  Copyright © 2017 Tim Beals. All rights reserved.
//

import Foundation

var completionHandlers = [()-> Void]()

func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
    completionHandler()
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

someFunctionWithEscapingClosure {
    print("Hello")
}
