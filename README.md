# Sourcery - CodeGen Templates

# Model Builders
Code gen Model Builders for Unit tests. 

example:
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
