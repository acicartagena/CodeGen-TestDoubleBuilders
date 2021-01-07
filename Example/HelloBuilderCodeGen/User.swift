// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

struct User {
    struct Name {
        let first: String
        let last: String
    }
    
    let name: Name
    let id: UUID
    let email: String
}
