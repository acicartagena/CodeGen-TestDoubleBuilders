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
// GENERATED CODE - changes done will be overwritten
final class GroupBuilder {
	private var members: [User]? = {
        guard let user = try? UserBuilder().with(email: "me@email.com").build() else { return [] }
        return [user]
    }()
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
		guard let members = self.members else { throw AutoTestBuilderError.missingValue("members") }
		guard let name = self.name else { throw AutoTestBuilderError.missingValue("name") }
		return Group(
			members:members,
			name:name
		)
	}

}
// sourcery:end
