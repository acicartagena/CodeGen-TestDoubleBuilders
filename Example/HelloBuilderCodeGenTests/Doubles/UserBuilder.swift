// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
@testable import HelloBuilderCodeGen

extension User: AutoTestBuilder {
    static private let nameTestDefault = User.Name(first: "A", last: "C")
    static private let idTestDefault = UUID()
}

// sourcery:inline:User.AutoTestBuilder
// GENERATED CODE - changes done will be overwritten
final class UserBuilder {
	private var name: User.Name? = User.Name(first: "A", last: "C")
	private var id: UUID? = UUID()
	private var email: String?	

	func with(name: User.Name) -> UserBuilder {
		self.name = name
		return self
	}
	func with(id: UUID) -> UserBuilder {
		self.id = id
		return self
	}
	func with(email: String) -> UserBuilder {
		self.email = email
		return self
	}

	func build() throws -> User {
		guard let name = self.name else { throw AutoTestBuilderError.missingValue("name") }
		guard let id = self.id else { throw AutoTestBuilderError.missingValue("id") }
		guard let email = self.email else { throw AutoTestBuilderError.missingValue("email") }
		return User(
			name:name,
			id:id,
			email:email
		)
	}

}
// sourcery:end
