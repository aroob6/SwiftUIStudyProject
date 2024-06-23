## 스터디 날짜
24.6.22 1pm ~ 3pm   
<br/>
  
## 제작 화면
LoginView | CollectionsView
---|---|
<img width="240" alt="Login" src="https://github.com/aroob6/SwiftUIStudyProject/assets/67883020/dd161e5b-020f-43a3-9cee-86e3f29364ac">|<img width="240" alt="Collections" src="https://github.com/aroob6/SwiftUIStudyProject/assets/67883020/f5199b7f-0a9c-4712-a814-5fc012a57c2d">



## 코드
#### Main ContentView
- ZStack으로 background image 설정 
- @State

```swift
// Main ContentView
struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPresented = false
    
    var body: some View {
        ZStack {
            Image("bgImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            LoginForm(email: $email, password: $password, isPresented: $isPresented)
        }
    }
}
```
#### LoginView
- StyleConstants: 스타일 상수화 
- @ViewBuilder
- @Binding
```swift
// LoginView
struct StyleConstants {
    static let titleFont: Font = .largeTitle
    static let footnoteFont: Font = .footnote
    static let FontWeightBold: Font.Weight = .bold
    static let ColorWhite: Color = .white
    static let ColorBlack: Color = .black
    static let ColorRed: Color = .red
}

struct LoginForm: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            loginHeaderView
            emailPasswordView
            loginButton
            signUpButton
        }
        .padding(50)
    }
    
    @ViewBuilder
    private var loginHeaderView: some View {
        HStack {
            Text("YOUR \nART \nMUSEUM")
                .padding(.bottom, 10)
                .font(StyleConstants.titleFont)
                .fontWeight(StyleConstants.FontWeightBold)
                .foregroundStyle(StyleConstants.ColorWhite)
            Spacer()
        }
        HStack {
            Text("151 3rd St \nSan Francisco, CA 94103")
                .padding(.bottom, 10)
                .font(StyleConstants.footnoteFont)
                .fontWeight(StyleConstants.FontWeightBold)
                .foregroundStyle(StyleConstants.ColorWhite)
            Spacer()
        }
    }
    
    @ViewBuilder
    private var emailPasswordView: some View {
        TextField("Email address", text: $email)
            .padding()
            .background(Color.white)
        
        SecureField("Password", text: $password)
            .padding()
            .background(Color.white)
        
        HStack {
            Spacer()
            Button("Forgot your password?") {
                print("Forgot password tapped")
            }
            .font(StyleConstants.footnoteFont)
            .foregroundStyle(StyleConstants.ColorWhite)
        }
        .padding(.bottom, 50)
    }
    
    private var loginButton: some View {
        Button("Log In") {
            self.isPresented.toggle()
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            CollectionsView()
        })
        .padding()
        .frame(maxWidth: .infinity)
        .background(StyleConstants.ColorRed)
        .fontWeight(StyleConstants.FontWeightBold)
        .foregroundStyle(StyleConstants.ColorWhite)
    }
    
    private var signUpButton: some View {
        Button("Don't have an account?") {
            print("Sign up tapped")
        }
        .padding(.top, 10)
        .font(StyleConstants.footnoteFont)
        .foregroundStyle(StyleConstants.ColorWhite)
    }
}
```
#### CollectionsView
- ScrollView 와 LazyVGrid
- ForEach
- @ViewBuilder
- @Binding
```swift
// CollectionsView
struct CollectionsView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
            collectionHeaderView
            SearchBar(text: $searchText).padding([.leading,.trailing, .bottom], 10)
            CollectionsLazeVGrid()

        }
    }
    
    @ViewBuilder
    private var collectionHeaderView: some View {
        ZStack {
            HStack {
                Text("THE\nART\nMUSEUM")
                    .padding()
                    .fontWeight(StyleConstants.FontWeightBold)
                    .font(StyleConstants.footnoteFont)
                    .foregroundStyle(StyleConstants.ColorBlack)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Collentions")
                    .padding()
                    .fontWeight(StyleConstants.FontWeightBold)
                    .foregroundStyle(StyleConstants.ColorRed)
                Spacer()
            }
        }
    }
}

struct CollectionsItem: Hashable {
    let image: String
    let text: String
}

struct CollectionsLazeVGrid: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let items = [
        CollectionsItem(image: "bgImage", text: "1"),
        CollectionsItem(image: "bgImage", text: "2"),
        CollectionsItem(image: "bgImage", text: "3"),
        CollectionsItem(image: "bgImage", text: "4"),
        CollectionsItem(image: "bgImage", text: "5"),
        CollectionsItem(image: "bgImage", text: "6"),
        CollectionsItem(image: "bgImage", text: "7"),
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        Image(item.image).resizable().frame(width: 160, height: 130)
                        HStack {
                            Text(item.text).foregroundStyle(StyleConstants.ColorRed)
                            Spacer()
                        }.padding(.leading, 20)
                    }
                }
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Explore the Collection", text: $text)
            Image(systemName: "magnifyingglass").foregroundStyle(StyleConstants.ColorRed)
            
        }
        .padding()
        .border(StyleConstants.ColorRed, width: 3)
        .foregroundColor(.secondary)
        HStack {
            Text("Advanced Search")
                .font(StyleConstants.footnoteFont)
                .foregroundStyle(StyleConstants.ColorRed)
            Spacer()
        }
    }
}

```
