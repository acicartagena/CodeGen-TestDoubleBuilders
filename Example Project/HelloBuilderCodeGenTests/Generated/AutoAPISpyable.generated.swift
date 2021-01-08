// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import HelloBuilderCodeGen
final class MessagesAPISpy: MessagesAPI {

    enum Call {
        case fetchAll
        case message
    }
    var calls: [Call] = []

    var fetchAllResult: Result<[Message], APIError>?
    var messageResult: Result<Message, APIError>?

    func fetchAll(completion: (Result<[Message], APIError>) -> Void) {
        calls.append(.fetchAll)
        completion(fetchAllResult ?? .failure(.other))
    }
    func message(id: String, completion: (Result<Message, APIError>) -> Void) {
        calls.append(.message)
        completion(messageResult ?? .failure(.other))
    }
}
