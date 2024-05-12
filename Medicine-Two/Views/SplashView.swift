//
//  SplashView.swift
//  Medicine-Two
//
//  Created by Kaif Ali Khan Pathan on 22/04/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var animationValues: [Bool] = Array(repeating: false, count: 15)
    
    var body: some View {
        
        ZStack {
            // Home view
            Color.white.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            ZStack {
                // Main eye background
                Circle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(hex: "9c6c4c")]), startPoint: .top, endPoint: .bottom)
                    )
                    .frame(width: 200, height: 200)
                    .scaleEffect(animationValues[0] ? 1 : 0,anchor: .bottom)
                
                if animationValues[1]{
                    
                    Ellipse()
                        .fill(.black)
                        .frame(width: 15, height: 20)
                        .offset(x: animationValues[2] ? 35 : 0, y: animationValues[3] ? -30 : 0)
                    
                    Ellipse()
                        .fill(.black)
                        .frame(width: 15, height: 20)
                        .offset(x: animationValues[2] ? -35 : 0, y: animationValues[3] ? -30 : 0)
                    
                }
                
                if animationValues[4]{
                    
                    Circle()
                        .fill(Color(hex: "9c6c4c"))
                        .frame(width: 60, height: 300)
                        .offset(x: -90, y: -60)
                    
                    Circle()
                        .fill(Color(hex: "9c6c4c"))
                        .frame(width: 60, height: 300)
                        .offset(x: 90, y: -60)
                    
                }
                
                if animationValues[5]{
                    Circle()
                        .fill(.black)
                        .frame(width: 30, height: 30)
                    
                    Ellipse()
                        .fill(.black)
                        .frame(width: 45, height: 20)
                        .offset(x: 0, y: 0)
                    
                }
                
                if animationValues[6]{
                    Ellipse()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.white, Color("00008B")]),
                                center: .center, startRadius: 0, endRadius: 50
                            )
                        )
                        .frame(width: 5, height: 8) // Iris size
                        .offset(x: -35, y: -30)
                    
                    Ellipse()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [Color.white, Color("00008B")]),
                                center: .center, startRadius: 0, endRadius: 50
                            )
                        )
                        .frame(width: 5, height: 8) // Iris size
                        .offset(x: 35, y: -30)
                }
                
                if animationValues[7]{
                    SmileView()
                        .fill(.black)
                        .stroke(Color.black, lineWidth: 3)  // Example styling
                        .frame(width: 50, height: 30)
                        .offset(y: 35)
                    
                }
                if animationValues[8]{
                    FontView()
                }
                    
                
                
            }
            .environment(\.colorScheme, .light)
        }
        .onAppear{
            withAnimation(.easeInOut(duration: 0.3)){
                animationValues[0] = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                animationValues[1] = true
                
                withAnimation(.easeInOut(duration: 0.4).delay(0.1)){
                    animationValues[2] = true
                    animationValues[3] = true
                                        
                }
                withAnimation(.easeInOut(duration: 0.5).delay(0.2)){
                    animationValues[4] = true
                    animationValues[5] = true

                }
                withAnimation(.easeInOut(duration: 0.9).delay(0.3)){
                    animationValues[6] = true
                }
                
                withAnimation(.easeInOut(duration: 0.4).delay(0.5)){
                    animationValues[7] = true
                }
                withAnimation(.easeInOut(duration: 0.7).delay(0.5)){
                    animationValues[8] = true
                }
            }
            
        }
    }
    
}

struct FontView: View {
    let titleFont = Font.largeTitle.lowercaseSmallCaps()
    let footnoteFont = Font.system(.footnote, design: .serif, weight: .bold)
    
    var body: some View {
        VStack {
            Text("Medicine")
                .font(titleFont)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white) // Change the color as needed
                .foregroundColor(.black) // Text color
                .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners
                .shadow(radius: 5) // Optional shadow for depth
                .padding(.horizontal)
            
            Spacer() // Keeps the banner at the top
        }
        .padding(.top) // Optional top padding for better spacing
    }
}


struct SmileView: Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let controlPointY = rect.maxY * 1.5 // Adjust the multiplier to change the smile arc
        let start = CGPoint(x: rect.minX, y: rect.midY)
        let end = CGPoint(x: rect.maxX, y: rect.midY)
        let controlPoint = CGPoint(x: rect.midX, y: controlPointY)
        
        path.move(to: start)
        path.addQuadCurve(to: end, control: controlPoint)
        return path
    }
    
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
