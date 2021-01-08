// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

protocol MessagesAPI: AutoAPISpyable {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void)
}

struct MessagesAPIService: MessagesAPI {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void) {
        // todo. doesn't matter
    }
}

