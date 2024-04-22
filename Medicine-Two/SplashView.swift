//
//  SplashView.swift
//  Medicine-Two
//
//  Created by Kaif Ali Khan Pathan on 22/04/2024.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Rectangle()
                    .background(Color.black)
                Image("WeBareCross")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 100)
                    .frame(width: 300, height: 300)
                
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation{
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
     }
}
