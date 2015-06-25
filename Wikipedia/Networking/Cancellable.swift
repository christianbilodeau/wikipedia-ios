//
//  Cancellable.swift
//  Wikipedia
//
//  Created by Brian Gerstle on 6/23/15.
//  Copyright (c) 2015 Wikimedia Foundation. All rights reserved.
//

import Foundation

protocol Cancellable {
    func cancel() -> Void
}
