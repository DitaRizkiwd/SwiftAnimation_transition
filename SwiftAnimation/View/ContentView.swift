//
//  ContentView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var colorChanged = false
    @State private var sizeChanged = false
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 200, height: 200)
                .foregroundStyle(.cyan)
            
            Image(systemName: "heart.fill")
                .foregroundStyle(colorChanged ? .pink : .white)
                .font(.system(size: 100))
                .scaleEffect(sizeChanged ? 1.0 : 0.5)
        }
        //Implicit Animation
//        .animation(.default, value: colorChanged)
//        .animation(.default, value: sizeChanged)
        .onTapGesture {
            //explicit Animation -> hanya di dalam modifier tertentu
            withAnimation(.spring(.bouncy, blendDuration: 1.0)){
                colorChanged.toggle()
                sizeChanged.toggle()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
