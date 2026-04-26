import SwiftUI

struct SettingsView: View {
    @AppStorage("darkMode") private var darkMode = false
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"

    var body: some View {
        NavigationStack {
            Form {
                Section("外观") {
                    Toggle("深色模式", isOn: $darkMode)
                }
                Section("关于") {
                    HStack {
                        Text("版本")
                        Spacer()
                        Text(appVersion).foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("菜谱总数")
                        Spacer()
                        Text("\(RecipeStore.all.count)道").foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("分类数量")
                        Spacer()
                        Text("\(RecipeCategory.allCases.count)个").foregroundStyle(.secondary)
                    }
                }
                Section("潮州菜文化") {
                    Text("潮州菜源自广东潮汕地区，以选料考究、制作精细、清鲜不腻著称，有『食在广州，味在潮州』的美誉。潮州菜善烹海鲜，讲究原汁原味，注重『一菜一碟』的酱料搭配。2022年潮州成为联合国教科文组织创意城市网络『美食之都』。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("设置")
        }
    }
}

#Preview { SettingsView() }
