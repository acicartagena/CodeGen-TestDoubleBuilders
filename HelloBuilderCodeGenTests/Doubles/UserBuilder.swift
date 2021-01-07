// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
@testable import HelloBuilderCodeGen

extension User: AutoTestBuilder {
    static private let nameTestDefault = "Name"
    static private let idTestDefault = UUID()
}

// sourcery:inline:User.AutoTestDoubleBuilder
// sourcery:end
