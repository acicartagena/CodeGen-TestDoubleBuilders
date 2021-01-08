# CodeGen - API Client Spy

This code uses [Sourcery](https://github.com/krzysztofzablocki/Sourcery) as a way to codegen Model Builders using `AutoAPISpyable.swifttemplate` 
// TODO: Spy part of the API Client

## API Client Spy
The implementation for the API layer in this code is having a `protocol <X>API` and a concremet implementation like `struct <X>APIService: <X>API`.  This one is done so it can be injected in ViewModels or Interactors like `init(api: <X>API)` which allows it to be mocked in unit tests. In the example used here, closures are used as completion handlers. The template assumes this is the implementation and would need to be adjusted if a different approach is used like combine / futures. 

```
protocol MessagesAPI {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void)
    func message(id: UUID, completion: (Result<Message, APIError>) -> Void)
}

struct MessagesAPIService: MessagesAPI {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void) {
        // todo
    }
    
    func message(id: UUID, completion: (Result<Message, APIError>) -> Void) {
        // todo
    }
}
```

One way of mocking is introducting an API Client spy like `struct <X>APISpy: <X>API` where you can set the variable for the result type  which would be used in mocking 

```
final class MessagesAPISpy: MessagesAPI {
    enum Call {
        case .fetchAll
        case .message(id: UUID)
    }
    var calls: [Call]
    
    var fetchAllResult: Result<[Message], APIError>?
    var messageResult: Result<Message, APIError>?

    func fetchAll(completion: (Result<[Message], APIError>) -> Void) {
        calls.append(.fetchAll)
        completion(fetchAllResult ?? .failure(.other))
    }
    
    func message(id: UUID, completion: (Result<Message, APIError>) -> Void) {
        calls.append(.message(id:id))
        completion(messageResult ?? .failure(.other))
    }
}
```
 
## Example
In this example an empty `AutoAPISpyable` protocol is introduced. The API protocol then needs to extend from it:
```
protocol MessagesAPI: AutoAPISpyable {
    func fetchAll(completion: (Result<[Message], APIError>) -> Void)
    func message(id: UUID, completion: (Result<Message, APIError>) -> Void)
}
```

The code would be generated in between `//sourcery` comments

For this example:
- the api protocols need to extend `AutoAPISpyable` to be included when generating the API Spy.
- code will be generated in 1 file in the directory specified in --output (change the --output directory to where the file is stored so it gets overwritten)

on terminal run:
```
sourcery --sources . --output Generated --templates .
```

## Output


## Others

