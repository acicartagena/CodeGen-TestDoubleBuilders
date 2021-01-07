// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

import Foundation
@testable import HelloBuilderCodeGen

extension Group: AutoTestBuilder {
    static private let membersTestDefault: [User] = []
    static private let nameTestDefault = "Group"
}

// sourcery:inline:Group.AutoTestBuilder
// sourcery:end
