# CodeGen - Model Builders

This code uses [Sourcery](https://github.com/krzysztofzablocki/Sourcery) as a way to codegen Model Builders using `AutoTestBuilder.swifttemplate` 

## Model Builders
  Models when used in Unit tests can add additional work to be able to be instantiated. This additional work can be in the form of always using the app module's init method all the time or creating convenience inits. This is where the builder pattern comes in to be able to customise instantiation of models for unit tests. 

Model (App):
```
struct User: Codable {
    let name: String
}
```
Model Builder (Unit tests):
```
class UserBuilder {
    private var name: String? = "A"
    func with(name: String) -> UserBuilder {
        self.name = name
        return self
    }
    func build() -> User {
        return User(name: name)
    }
}
```
Usage (Unit tests):
```
let userA: User = UserBuilder().build()
let userB: User = UserBuilder().with(name: "B").build()
```
Writing model builders can be more work than writing convenience initializers. This is where the idea of code generating model builders came into mind.

## Example
```
extend User: AutoTestBuilder {
    private static let nameTestDefault = "A"
}

// sourcery:inline:User.AutoTestBuilder
// sourcery:end
```
The code would be generated in between `//sourcery` comments

For this example:
- the models need to extend `AutoTestBuilder` to be included when generating the model builders.
- generated private properties are `optional`, can specify a default using a `static` variable with the `TestDefault` prefix
- code will be generated in between `//sourcery` comments for each file

on terminal run:
```
sourcery --sources Example/ --templates .
```

## Output
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

## Others
- code can also be generated all in 1 file. The trade-off in readability would lessen the risk of developers editing the generated code. 
- instead of manually running sourcery can add as a build phase
