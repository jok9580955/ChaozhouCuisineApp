import SwiftUI

struct SearchView: View {
    @State private var query = ""
    @EnvironmentObject var favorites: FavoritesManager
    private var results: [Recipe] {
        guard !query.isEmpty else { return RecipeStore.all }
        let q = query.lowercased()
        return RecipeStore.all.filter {
            $0.name.lowercased().contains(q) ||
            $0.category.rawValue.lowercased().contains(q) ||
            $0.ingredients.contains(where: { $0.name.lowercased().contains(q) }) ||
            $0.culturalNote.lowercased().contains(q)
        }
    }

    var body: some View {
        NavigationStack {
            List(results) { recipe in
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack(spacing: 12) {
                        RecipeImageView(recipe: recipe)
                            .frame(width:44,height:44)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        VStack(alignment: .leading) {
                            Text(recipe.name).font(.body).bold()
                            Text(recipe.category.rawValue).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .searchable(text: $query, prompt: "搜索菜名、食材、分类...")
            .navigationTitle("搜索")
        }
    }
}

struct FavoritesView: View {
    @EnvironmentObject var favorites: FavoritesManager
    private var favRecipes: [Recipe] {
        RecipeStore.all.filter { favorites.isFavorite($0) }
    }

    var body: some View {
        NavigationStack {
            Group {
                if favRecipes.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "heart.slash").font(.system(size: 50)).foregroundStyle(.tertiary)
                        Text("暂无收藏").font(.title3).foregroundStyle(.secondary)
                        Text("浏览菜谱时点击 ❤️ 收藏").font(.caption).foregroundStyle(.tertiary)
                    }
                } else {
                    List(favRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            HStack(spacing: 12) {
                                RecipeImageView(recipe: recipe)
                                    .frame(width:44,height:44)
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                VStack(alignment: .leading) {
                                    Text(recipe.name).font(.body).bold()
                                    Text(recipe.category.rawValue).font(.caption).foregroundStyle(.secondary)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("我的收藏")
        }
    }
}

#Preview { SearchView().environmentObject(FavoritesManager()) }
