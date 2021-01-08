// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import HelloBuilderCodeGen
final class MessagesAPISpy: MessagesAPI {
    var fetchAllResult: Result<[Message], APIError>?

    func fetchAll(completion: (Result<[Message], APIError>) -> Void) {
        completion(fetchAllResult ?? .failure(.other))
    }
}
