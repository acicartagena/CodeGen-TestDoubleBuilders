// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

protocol AutoTestBuilder { }

enum AutoTestBuilderError: Error {
    case missingValue(String)
}
