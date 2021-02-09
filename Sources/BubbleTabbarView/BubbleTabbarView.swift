import SwiftUI

public struct BubbleTabbarView<TabItem: BubbleTabItemable>: View {
    public let tabItems: [TabItem]
    @State public var selectedTabItem: TabItem?
    @State private var xAxis: CGFloat = 0
    private let imageSize = CGSize(width: 25, height: 25)
    private let defaultTabItem: TabItem
    
    public init(tabItems: [TabItem], selectedTabItem: TabItem) {
        self.tabItems = tabItems
        self.defaultTabItem = selectedTabItem
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            (selectedTabItem == nil ? Color.clear : selectedTabItem?.backgroundColor).transition(.opacity)
            VStack(spacing: 0) {
                selectedTabItem?.view.transition(.opacity)
                HStack {
                    ForEach(tabItems, id: \.self) { tab in
                        GeometryReader { reader in
                            Button {
                                withAnimation {
                                    selectedTabItem = tab
                                    xAxis = reader.frame(in: .global).midX
                                }
                            } label: {
                                HStack(alignment: .center) {
                                    Image(systemName: tab.image)
                                        .resizable()
                                        .renderingMode(.template)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: imageSize.width, height: imageSize.height)
                                        .padding()
                                        .background(
                                            Color.white.opacity(
                                                tab == selectedTabItem ? 1 : 0
                                            ).clipShape(Circle())
                                            .scaleEffect(
                                                tab == selectedTabItem ? 1 : 0.3
                                            )
                                        )
                                        .foregroundColor(selectedTabItem == tab ? tab.selectedColor : tab.deselectedColor)
                                        .offset(x: 0, y: tab == selectedTabItem ? -imageSize.height * 1.5 : 0)
                                        .animation(.spring(response: 0.55, dampingFraction: 0.6, blendDuration: 0))
                                }.frame(width: reader.size.width, height: reader.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            .onAppear {
                                if tab == selectedTabItem {
                                    xAxis = reader.frame(in: .global).midX
                                }
                            }
                        }
                        .frame(maxHeight: imageSize.height, alignment: .center)
                    }
                }
                .padding()
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color(red: 245, green: 245, blue: 245, opacity: 1).clipShape(WaveShape(xAxis: xAxis)))
            }
        }
        .ignoresSafeArea()
        .onAppear {
            selectedTabItem = defaultTabItem
        }
    }
}

