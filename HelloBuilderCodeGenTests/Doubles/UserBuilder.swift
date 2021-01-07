// Copyright © 2020 ACartagena. All rights reserved.

import Foundation
@testable import HelloBuilderCodeGen

extension User: AutoTestBuilder {
    static private let nameTestDefault = "Name"
    static private let idTestDefault = UUID()
    static private let emailTestDefault = "name@hello.com"
}

// sourcery:inline:User.AutoTestDoubleBuilder
final class UserBuilder {
	private var name: String? = "Name"
	private var id: UUID? = UUID()
	private var email: String? = "name@hello.com"

	func with(name: String) -> UserBuilder {
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
		guard let name = self.name else { throw AutoTestBuilderError.missingValue }
		guard let id = self.id else { throw AutoTestBuilderError.missingValue }
		guard let email = self.email else { throw AutoTestBuilderError.missingValue }
		return User(
			name:name,
			id:id,
			email:email
		)
	}

}
// sourcery:end
