import SwiftUI

struct RecipeImageView: View {
    let recipe: Recipe
    
    var body: some View {
        if let uiImage = UIImage(named: recipe.imageName) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            ZStack {
                recipe.category.color.opacity(0.15)
                Image(systemName: recipe.category.icon)
                    .font(.system(size: 44))
                    .foregroundStyle(recipe.category.color)
            }
        }
    }
}
