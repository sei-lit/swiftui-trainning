import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @StateObject private var apiClient = BooksAPIClient()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(apiClient.books?.items ?? [], id: \.id) { item in
                    SearchRowView(imageUrl: item.volumeInfo.imageLinks?.thumbnail,
                                  title: item.volumeInfo.title,
                                  publisher: item.volumeInfo.publisher
                    )
                }
            }
            .navigationTitle("探す")
            .listStyle(.grouped)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "本を検索")
        .onChange(of: searchText) {
            apiClient.fetchBooks(queryString: searchText)
        }
    }
}

#Preview {
    SearchView()
}
