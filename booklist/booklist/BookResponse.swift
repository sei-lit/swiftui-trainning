
struct BookResponse: Codable {
    var totalItems: Int
    var items: [BookItem]
}

struct BookItem: Codable {
    var kind: String
    var id: String
    var selfLink: String
    var volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    var title: String?
    var authors: [String]?
    var description: String?
    var publisher: String?
    var imageLinks: ImageLinks?
}

struct ImageLinks: Codable {
    var smallThumbnail: String?
    var thumbnail: String?
}
