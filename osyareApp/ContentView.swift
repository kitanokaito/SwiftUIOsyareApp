import SwiftUI

struct ContentView: View {
  @State var buttonTag = 0
  
  var body: some View {
    VStack(spacing: 0) {
      ZStack {
        Color.blue
          .frame(
            width: UIScreen.main.bounds.width,
            height: 200
        )
        
        VStack(spacing: 0) {
          HStack(spacing: 0) {
            Image(systemName: "camera")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.white)
            
            Spacer()
            Text("Custom Shape")
              .font(.system(size: 20, weight: .heavy, design: .default))
              .foregroundColor(.white)
              .fixedSize()
            
            Spacer()
            Image(systemName: "magnifyingglass")
              .resizable()
              .frame(width: 20, height: 20)
              .foregroundColor(.white)
          }
          .frame(width: UIScreen.main.bounds.width / 1.1)
          .padding(.bottom, 30)
          
          HStack(spacing: 50) {
            Button(action: {}){
              Text("Vistors")
                .padding(10)
                .font(.system(size: 12, weight: .medium, design: .default))
                .foregroundColor(.white)
                .background(
                  LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
              )
                .cornerRadius(8)
            }
            Button(action: {}){
              Text("Pokemons")
                .padding(10)
                .font(.system(size: 12, weight: .medium, design: .default))
                .foregroundColor(.white)
                .background(
                  LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
              )
                .cornerRadius(8)
            }
            Button(action: {}){
              Text("Type")
                .padding(10)
                .font(.system(size: 12, weight: .medium, design: .default))
                .foregroundColor(.white)
                .background(
                  LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color.pink]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                  )
              )
                .cornerRadius(8)
            }
          }
          .padding()
          .background(Color.white.opacity(0.5))
          .cornerRadius(8)
        }
        .frame(
          width: UIScreen.main.bounds.width,
          height: 200
        )
          .background(
            LinearGradient(
              gradient: Gradient(colors: [Color.purple, Color.pink]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
        )
          .clipShape(CustomCorner(corner: .bottomLeft, size: 65))
      }
      
      ZStack{
        Color.pink
        Color.blue
          .clipShape(CustomCorner(corner: .topRight, size: 65))
        ScrollView(showsIndicators: false) {
          HStack(spacing: 0) {
            Text("All Vistor")
              .font(.system(size: 25))
              .font(.system(.title, design: .default))
            
            Spacer()
            Image(systemName: "slider.horizontal.3")
              .resizable()
              .foregroundColor(.gray)
              .frame(width: 20, height: 20)
          }
          .padding(.top)
          .padding(.horizontal, 30)
          
          ForEach(0..<10) {_ in
            Cell()
              .padding(10)
          }
        }
      }
    }
    .background(Color.blue.opacity(0.2))
    .edgesIgnoringSafeArea(.top)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct Cell: View {
  var body: some View {
    HStack(alignment: .top) {
      PokeThumbnail()
        .padding(.trailing, 10)
      VStack(alignment: .leading, spacing: 0) {
        Text("pikachu")
          .font(.system(size: 15, weight: .bold, design: .default))
          .font(.system(.title))
        
        Spacer()
        Text("pika!!!!")
          .font(.system(size: 12, weight: .medium, design: .default))
      }
      
      Spacer()
      Text("03:35")
        .font(.system(size: 14, weight: .bold, design: .default))
    }
    .padding(.horizontal)
  }
}

struct PokeThumbnail: View {
  var body: some View {
    Image("pokeThumbnail")
      .resizable()
      .frame(width: 40, height: 40)
      .overlay(
        Circle()
          .stroke(LinearGradient(
            gradient: Gradient(colors: [Color.purple, Color.pink]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          ), lineWidth: 3)
    )
  }
}

struct CustomCorner : Shape {
  
  var corner : UIRectCorner
  var size : CGFloat
  
  func path(in rect: CGRect) -> Path {
    
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: size, height: size))
    
    return Path(path.cgPath)
  }
}
