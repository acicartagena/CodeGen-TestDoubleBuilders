// Copyright © 2020 ACartagena. All rights reserved.

import Foundation

import Foundation
@testable import HelloBuilderCodeGen

extension Group: AutoTestBuilder {
    static private let membersTestDefault: [User] = {
        guard let user = try? UserBuilder().with(email: "me@email.com").build() else { return [] }
        return [user]
    }()
    static private let nameTestDefault = "Group"
}

// sourcery:inline:Group.AutoTestBuilder
final class GroupBuilder {
	private var members: [User]? = []
	private var name: String? = "Group"

	func with(members: [User]) -> GroupBuilder {
		self.members = members
		return self
	}
	func with(name: String) -> GroupBuilder {
		self.name = name
		return self
	}

	func build() throws -> Group {
		guard let members = self.members else { throw AutoTestBuilderError.missingValue }
		guard let name = self.name else { throw AutoTestBuilderError.missingValue }
		return Group(
			members:members,
			name:name
		)
	}

}
// sourcery:end
