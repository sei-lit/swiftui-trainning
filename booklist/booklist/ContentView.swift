import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LibraryView()
                .tabItem {
                    Label("読みたい本", systemImage: "book")
                }
            SearchView()
                .tabItem {
                    Label("探す", systemImage: "magnifyingglass")
                }
        }
    }
}


#Preview {
    ContentView()
}
