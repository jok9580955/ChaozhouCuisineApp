import SwiftUI
import Combine

// MARK: - 菜品分类
enum RecipeCategory: String, CaseIterable, Identifiable {
    case braised = "卤味"
    case seafood = "海鲜"
    case rawPickled = "生腌"
    case kueh = "粿品小吃"
    case dessert = "甜品"
    case soup = "汤品"
    case sideDish = "杂咸配粥"
    case classic = "经典名菜"
    case tea = "工夫茶"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .braised: return "flame.fill"
        case .seafood: return "fish.fill"
        case .rawPickled: return "snowflake"
        case .kueh: return "birthday.cake.fill"
        case .dessert: return "cup.and.saucer.fill"
        case .soup: return "mug.fill"
        case .sideDish: return "leaf.fill"
        case .classic: return "star.fill"
        case .tea: return "cup.and.saucer.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .braised: return Color(red: 0.76, green: 0.35, blue: 0.20)
        case .seafood: return Color(red: 0.20, green: 0.60, blue: 0.86)
        case .rawPickled: return Color(red: 0.30, green: 0.78, blue: 0.75)
        case .kueh: return Color(red: 0.90, green: 0.58, blue: 0.22)
        case .dessert: return Color(red: 0.85, green: 0.45, blue: 0.66)
        case .soup: return Color(red: 0.55, green: 0.78, blue: 0.35)
        case .sideDish: return Color(red: 0.60, green: 0.73, blue: 0.35)
        case .classic: return Color(red: 0.85, green: 0.65, blue: 0.20)
        case .tea: return Color(red: 0.45, green: 0.68, blue: 0.55)
        }
    }
}

// MARK: - 难度
enum Difficulty: Int, CaseIterable {
    case easy = 1, medium = 2, hard = 3
    var label: LocalizedStringKey {
        switch self {
        case .easy: return "简单"
        case .medium: return "中等"
        case .hard: return "困难"
        }
    }
}

// MARK: - 食材
struct Ingredient: Identifiable {
    let id = UUID()
    let name: String
    let amount: String
}

// MARK: - 步骤
struct CookingStep: Identifiable {
    let id = UUID()
    let order: Int
    let description: String
}

// MARK: - 菜谱
struct Recipe: Identifiable {
    let id: String
    let name: String
    let category: RecipeCategory
    let difficulty: Difficulty
    let prepTime: Int
    let cookTime: Int
    let servings: Int
    let ingredients: [Ingredient]
    let steps: [CookingStep]
    let tips: [String]
    let culturalNote: String
    
    var imageName: String { name }

    init(name: String, category: RecipeCategory, difficulty: Difficulty, prepTime: Int, cookTime: Int, servings: Int, ingredients: [Ingredient], steps: [CookingStep], tips: [String], culturalNote: String) {
        self.id = name
        self.name = name
        self.category = category
        self.difficulty = difficulty
        self.prepTime = prepTime
        self.cookTime = cookTime
        self.servings = servings
        self.ingredients = ingredients
        self.steps = steps
        self.tips = tips
        self.culturalNote = culturalNote
    }
}

// MARK: - 调味品百科
struct Condiment: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let usage: String
    let icon: String
}

// MARK: - 工夫茶
struct TeaInfo: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
}

// MARK: - 收藏管理
class FavoritesManager: ObservableObject {
    @Published var favoriteIDs: Set<String> = []

    private let key = "favoriteRecipes"

    init() {
        if let data = UserDefaults.standard.data(forKey: key),
           let ids = try? JSONDecoder().decode(Set<String>.self, from: data) {
            favoriteIDs = ids
        }
    }

    func toggle(_ recipe: Recipe) {
        if favoriteIDs.contains(recipe.id) {
            favoriteIDs.remove(recipe.id)
        } else {
            favoriteIDs.insert(recipe.id)
        }
        save()
    }

    func isFavorite(_ recipe: Recipe) -> Bool {
        favoriteIDs.contains(recipe.id)
    }

    private func save() {
        if let data = try? JSONEncoder().encode(favoriteIDs) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
