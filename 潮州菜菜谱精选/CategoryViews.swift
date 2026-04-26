import SwiftUI

// MARK: - 分类列表
struct CategoryListView: View {
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 14) {
                    ForEach(RecipeCategory.allCases) { cat in
                        NavigationLink(destination: destinationFor(cat)) {
                            VStack(spacing: 10) {
                                Image(systemName: cat.icon)
                                    .font(.title).foregroundStyle(cat.color)
                                    .frame(width: 60, height: 60)
                                    .background(cat.color.opacity(0.12))
                                    .clipShape(Circle())
                                Text(cat.rawValue).font(.headline).foregroundStyle(.primary)
                                Text(cat == .tea ? "文化百科" : "\(recipesFor(cat).count)道菜谱")
                                    .font(.caption).foregroundStyle(.secondary)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.15),lineWidth:1))
                        }
                    }
                }
                .padding()
            }
            .background(Color(red:0.98,green:0.96,blue:0.93).ignoresSafeArea())
            .navigationTitle("菜谱分类")
        }
    }
    private func recipesFor(_ cat: RecipeCategory) -> [Recipe] {
        RecipeStore.all.filter { $0.category == cat }
    }
    @ViewBuilder
    private func destinationFor(_ cat: RecipeCategory) -> some View {
        if cat == .tea {
            TeaCultureView()
        } else {
            CategoryDetailView(category: cat)
        }
    }
}

// MARK: - 分类详情
struct CategoryDetailView: View {
    let category: RecipeCategory
    @EnvironmentObject var favorites: FavoritesManager
    private var recipes: [Recipe] { RecipeStore.all.filter { $0.category == category } }
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeRow(recipe: recipe)
                    }
                }
            }
            .padding()
        }
        .background(Color(red:0.98,green:0.96,blue:0.93).ignoresSafeArea())
        .navigationTitle(category.rawValue)
    }
}

// MARK: - 菜谱行
struct RecipeRow: View {
    let recipe: Recipe
    var body: some View {
        HStack(spacing: 14) {
            RecipeImageView(recipe: recipe)
            .frame(width: 65, height: 65)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.name).font(.headline).foregroundStyle(.primary)
                HStack(spacing: 8) {
                    HStack(spacing: 2) {
                        ForEach(0..<recipe.difficulty.rawValue, id: \.self) { _ in
                            Image(systemName: "star.fill").font(.caption).foregroundStyle(.orange)
                        }
                    }
                    Label("\(recipe.prepTime+recipe.cookTime)分钟", systemImage: "clock")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundStyle(.tertiary)
        }
        .padding(12)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview { CategoryListView().environmentObject(FavoritesManager()) }
