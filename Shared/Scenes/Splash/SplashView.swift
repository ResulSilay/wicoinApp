//
//  SplashView.swift
//  wicoin (iOS)
//
//  Created by Resul Silay on 18.07.2021.
//

import SwiftUI

struct SplashView: View {
    
    @State var animate : Bool = false
    @State var endSplash : Bool = false
    
    var body: some View {
        
        ZStack{
            
            MainView()
            
            ZStack {
                
                Color("SplashBg")
                
                Image("Logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 100, height: animate ? nil : 100)
                    .scaleEffect(animate ? 3 : 1 )
                    .frame(width: UIScreen.main.bounds.width)
                
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash )
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            
            withAnimation(Animation.easeIn(duration: 0.85)){
                animate.toggle()
            }
            
            withAnimation(Animation.linear(duration: 0.85)){
                endSplash.toggle()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
