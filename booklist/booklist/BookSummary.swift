
import SwiftData

@Model
final class BookSummary {
    @Attribute(.unique) var id: String
    var title: String
    var thumbnail: String
    
    init(id: String, title: String, thumbnail: String) {
        self.id = id
        self.title = title
        self.thumbnail = thumbnail
    }
}
