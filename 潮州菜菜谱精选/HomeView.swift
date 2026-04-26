import SwiftUI

struct HomeView: View {
    @EnvironmentObject var favorites: FavoritesManager
    private let recipes = RecipeStore.all
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // 顶部横幅
                    headerBanner
                    // 分类快捷入口
                    categoryScroll
                    // 今日推荐
                    sectionHeader("今日推荐", icon: "flame.fill")
                    LazyVGrid(columns: columns, spacing: 14) {
                        ForEach(recipes.prefix(6)) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeCard(recipe: recipe)
                            }
                        }
                    }
                    .padding(.horizontal)
                    // 工夫茶入口
                    teaBanner
                    // 调味品百科入口
                    sectionHeader("潮州调味品", icon: "leaf.fill")
                    condimentScroll
                }
                .padding(.bottom, 30)
            }
            .background(
                LinearGradient(colors: [Color(red:0.98,green:0.96,blue:0.93), Color(red:0.95,green:0.92,blue:0.88)],
                               startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            )
            .navigationTitle("潮州菜菜谱精选")
        }
    }

    private var headerBanner: some View {
        ZStack(alignment: .bottomLeading) {
            LinearGradient(colors: [Color(red:0.76,green:0.35,blue:0.20), Color(red:0.85,green:0.50,blue:0.25)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(height: 180)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.2), lineWidth: 1)
            )
            VStack(alignment: .leading, spacing: 6) {
                Text("食在广州")
                    .font(.caption).foregroundStyle(.white.opacity(0.8))
                Text("味在潮州")
                    .font(.largeTitle).bold().foregroundStyle(.white)
                Text("精选地道潮汕风味菜谱")
                    .font(.subheadline).foregroundStyle(.white.opacity(0.9))
            }
            .padding(20)
        }
        .padding(.horizontal)
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
    }

    private var categoryScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(RecipeCategory.allCases) { cat in
                    NavigationLink(destination: categoryDestination(cat)) {
                        VStack(spacing: 6) {
                            Image(systemName: cat.icon)
                                .font(.title2)
                                .foregroundStyle(cat.color)
                                .frame(width: 50, height: 50)
                                .background(cat.color.opacity(0.12))
                                .clipShape(Circle())
                            Text(cat.rawValue)
                                .font(.caption).foregroundStyle(.primary)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }

    @ViewBuilder
    private func categoryDestination(_ cat: RecipeCategory) -> some View {
        if cat == .tea {
            TeaCultureView()
        } else {
            CategoryDetailView(category: cat)
        }
    }

    private var teaBanner: some View {
        NavigationLink(destination: TeaCultureView()) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Label("潮州工夫茶", systemImage: "cup.and.saucer.fill")
                        .font(.headline).foregroundStyle(.primary)
                    Text("茶具·冲泡·茶种 文化百科")
                        .font(.caption).foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.2),lineWidth:1))
            .padding(.horizontal)
        }
    }

    private var condimentScroll: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(CondimentStore.all) { c in
                    VStack(spacing: 6) {
                        Image(systemName: c.icon).font(.largeTitle)
                            .foregroundStyle(Color(red:0.76,green:0.35,blue:0.20))
                        Text(c.name).font(.caption2).bold()
                        Text(c.usage).font(.caption2).foregroundStyle(.secondary).lineLimit(1)
                    }
                    .frame(width: 90, height: 100)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(.horizontal)
        }
    }

    private func sectionHeader(_ title: String, icon: String) -> some View {
        HStack {
            Image(systemName: icon).foregroundStyle(Color(red:0.76,green:0.35,blue:0.20))
            Text(title).font(.title3).bold()
            Spacer()
        }
        .padding(.horizontal)
    }
}

// MARK: - 菜谱卡片
struct RecipeCard: View {
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RecipeImageView(recipe: recipe)
            .frame(height: 100)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            Text(recipe.name).font(.subheadline).bold().foregroundStyle(.primary).lineLimit(1)
            HStack(spacing: 2) {
                ForEach(0..<recipe.difficulty.rawValue, id: \.self) { _ in
                    Image(systemName: "star.fill").font(.caption2).foregroundStyle(.orange)
                }
                Spacer()
                Image(systemName: "clock").font(.caption2)
                Text("\(recipe.prepTime+recipe.cookTime)min").font(.caption2).foregroundStyle(.secondary)
            }
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white.opacity(0.15),lineWidth:1))
        .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
    }
}

#Preview { HomeView().environmentObject(FavoritesManager()) }
