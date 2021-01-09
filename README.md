# Sourcery - CodeGen Templates

[Sourcery](https://github.com/krzysztofzablocki/Sourcery) is a code generator for Swift language. 

The templates in this repo has assumptions on the architecture of the codebase. Types used in the codebase need to implement or extend the template protocols to be part of the type to be processed. Instead of having the template address all the different cases, they mostly try to cover the simple one scenarios. This leaves the developer to write the custom handcrafted code for the more complex and bespoke types.

[Reference](https://cdn.rawgit.com/krzysztofzablocki/Sourcery/master/docs/Types.html)

# Model Builders

## Code gen
User.swift
```
struct User: Codable {
    let name: String
}
```
UserBuilder.swift
```
extension User: AutoTestBuilder {
    static private let nameTestDefault = "A"
}

// sourcery:inline:User.AutoTestBuilder
// GENERATED CODE - changes done will be overwritten
final class UserBuilder {
    private var name: String = "A" 

    func with(name: String) -> UserBuilder {
        self.name = name
        return self
    }

    func build() throws -> User {
        guard let name = self.name else { throw AutoTestBuilderError.missingValue("name") }
        return User(
            name:name
        )
    }
}
// sourcery:end
```

## Example
```
let userA: User = UserBuilder().build()
let userB: User = UserBuilder().with(name: "B").build()
```

# API Client Spy

## Code gen 
MessagesAPI.swift
```
protocol MessagesAPI: AutoAPISpyable {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void)
    func message(id: String, completion: (Result<Message, APIError>) -> Void)
}
```

AutoAPISpyable.generated.swift
```
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
```

## Example
```
func testFetchAll() {
    let spy = MessagesAPISpy()
    spy.fetchAllResults = .success([MessageBuilder().build()])
    let subject = MessagesViewModel(api: spy)
    subject.fetchAll()
    XCTAssertEqual(spy.calls, [.fetchAll])
}
```