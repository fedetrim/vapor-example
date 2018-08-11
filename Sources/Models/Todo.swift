import Foundation

/// A single entry of a Todo list.
public final class Todo: Codable {
    /// The unique identifier for this `Todo`.
    public var id: Int?

    /// A title describing what this `Todo` entails.
    public var title: String

    /// Creates a new `Todo`.
    public init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}
