import SwiftUI

struct ContentView: View {
    @StateObject private var favorites = FavoritesManager()
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem { Label("推荐", systemImage: "star.fill") }
                .tag(0)
            CategoryListView()
                .tabItem { Label("分类", systemImage: "square.grid.2x2.fill") }
                .tag(1)
            SearchView()
                .tabItem { Label("搜索", systemImage: "magnifyingglass") }
                .tag(2)
            FavoritesView()
                .tabItem { Label("收藏", systemImage: "heart.fill") }
                .tag(3)
            SettingsView()
                .tabItem { Label("设置", systemImage: "gearshape.fill") }
                .tag(4)
        }
        .tint(Color(red: 0.76, green: 0.35, blue: 0.20))
        .environmentObject(favorites)
    }
}

#Preview { ContentView() }
