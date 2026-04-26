import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    @EnvironmentObject var favorites: FavoritesManager

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // 头部
                ZStack(alignment: .bottomLeading) {
                    RecipeImageView(recipe: recipe)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    LinearGradient(colors:[.clear, .black.opacity(0.6)], startPoint:.top, endPoint:.bottom)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(recipe.name).font(.title).bold().foregroundStyle(.white)
                        HStack(spacing: 12) {
                            Label(recipe.difficulty.label, systemImage: "chart.bar.fill")
                            Label("\(recipe.prepTime+recipe.cookTime)分钟", systemImage: "clock")
                            Label("\(recipe.servings)人份", systemImage: "person.2")
                        }
                        .font(.caption).foregroundStyle(.white.opacity(0.9))
                    }
                    .padding(20)
                }
                .frame(height: 220)

                VStack(alignment: .leading, spacing: 24) {
                    // 文化故事
                    if !recipe.culturalNote.isEmpty {
                        storyCard
                    }
                    // 食材
                    ingredientSection
                    // 步骤
                    stepsSection
                    // 小贴士
                    if !recipe.tips.isEmpty {
                        tipsSection
                    }
                }
                .padding(20)
            }
        }
        .background(Color(red:0.98,green:0.96,blue:0.93).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { favorites.toggle(recipe) }) {
                    Image(systemName: favorites.isFavorite(recipe) ? "heart.fill" : "heart")
                        .foregroundStyle(favorites.isFavorite(recipe) ? .red : .gray)
                }
            }
        }
    }

    private var storyCard: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "book.fill").foregroundStyle(recipe.category.color)
            Text(recipe.culturalNote).font(.callout).foregroundStyle(.secondary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(recipe.category.color.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private var ingredientSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("食材清单").font(.title3).bold()
            ForEach(recipe.ingredients) { item in
                HStack {
                    Circle().fill(recipe.category.color).frame(width:6,height:6)
                    Text(item.name).font(.body)
                    Spacer()
                    Text(item.amount).font(.body).foregroundStyle(.secondary)
                }
                .padding(.vertical, 2)
            }
        }
        .padding(16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    private var stepsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("烹饪步骤").font(.title3).bold()
            ForEach(recipe.steps) { step in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(step.order)")
                        .font(.caption).bold().foregroundStyle(.white)
                        .frame(width:26,height:26)
                        .background(recipe.category.color)
                        .clipShape(Circle())
                    Text(step.description).font(.body)
                }
                .padding(.vertical, 4)
            }
        }
        .padding(16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }

    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("💡 小贴士").font(.title3).bold()
            ForEach(recipe.tips, id: \.self) { tip in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "lightbulb.fill").font(.caption).foregroundStyle(.yellow)
                    Text(tip).font(.callout)
                }
            }
        }
        .padding(16)
        .background(Color.yellow.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    NavigationStack {
        RecipeDetailView(recipe: RecipeStore.all[0])
    }.environmentObject(FavoritesManager())
}
