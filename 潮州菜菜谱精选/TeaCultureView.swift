import SwiftUI

struct TeaCultureView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // 头部
                ZStack {
                    LinearGradient(colors:[Color(red:0.45,green:0.68,blue:0.55),Color(red:0.35,green:0.55,blue:0.45)],
                                   startPoint:.topLeading, endPoint:.bottomTrailing)
                    VStack(spacing: 8) {
                        Image(systemName: "cup.and.saucer.fill").font(.system(size: 60)).foregroundStyle(.white)
                        Text("潮州工夫茶").font(.title).bold().foregroundStyle(.white)
                        Text("冲泡的学问与品饮的功夫").font(.subheadline).foregroundStyle(.white.opacity(0.8))
                    }
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)

                // 冲泡八步
                VStack(alignment: .leading, spacing: 12) {
                    Text("冲泡八步").font(.title3).bold()
                    ForEach(Array(TeaStore.steps.enumerated()), id:\.offset) { i, step in
                        HStack(spacing: 12) {
                            Text("\(i+1)").font(.caption).bold().foregroundStyle(.white)
                                .frame(width:26,height:26)
                                .background(Color(red:0.45,green:0.68,blue:0.55))
                                .clipShape(Circle())
                            Text(step).font(.body)
                            Spacer()
                        }
                    }
                }
                .padding(16)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)

                // 茶具四宝
                VStack(alignment: .leading, spacing: 12) {
                    Text("茶具四宝").font(.title3).bold()
                    ForEach(TeaStore.tools) { t in
                        HStack(spacing: 12) {
                            Image(systemName: t.icon).font(.title2)
                                .frame(width: 30)
                                .foregroundStyle(Color(red:0.76,green:0.35,blue:0.20))
                            VStack(alignment: .leading) {
                                Text(t.name).font(.headline)
                                Text(t.description).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(16)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)

                // 推荐茶种
                VStack(alignment: .leading, spacing: 12) {
                    Text("推荐茶种").font(.title3).bold()
                    ForEach(TeaStore.teas) { t in
                        HStack(spacing: 12) {
                            Image(systemName: t.icon).font(.title2)
                                .frame(width: 30)
                                .foregroundStyle(Color(red:0.45,green:0.68,blue:0.55))
                            VStack(alignment: .leading) {
                                Text(t.name).font(.headline)
                                Text(t.description).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(16)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding(.horizontal)
            }
            .padding(.bottom, 30)
        }
        .background(Color(red:0.98,green:0.96,blue:0.93).ignoresSafeArea())
        .navigationTitle("工夫茶")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview { NavigationStack { TeaCultureView() } }
