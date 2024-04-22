//
//  LoadingIndicator.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var isLoading = false;
    @State private var progress: CGFloat = 0.0
    var body: some View {
        VStack(spacing : 30){
            circleLoading()
            progressLoading()
        }
    }
}

#Preview {
    LoadingIndicator()
}

struct circleLoading: View {
    @State private var isLoading = false;
    var body: some View {
        Circle()
            .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.7)
            .stroke(Color.cyan, lineWidth: 16)
            .frame(width: 80, height: 80)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: isLoading)
//            .animation(.easeIn.repeatForever(autoreverses: false), value: isLoading)
            .onAppear{
                isLoading = true
            }
    }
}




struct progressLoading: View {
    @State private var isLoading = false;
    @State private var progress: CGFloat = 0.0
    var body: some View {
        ZStack{
            Text("\(progress * 100, specifier: "%.f")%")
            Circle()
                .stroke(Color(.systemGray5),lineWidth: 16)
                .frame(width: 80, height: 80)
            Circle()
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: 0.7)
                .stroke(Color.cyan, lineWidth: 16)
                .frame(width: 80, height: 80)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.8).repeatForever(autoreverses: false), value: isLoading)
                .onAppear{
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){
                        timer in /*progress += 0.05 */
                        if progress > 1.0 {
                            //                                timer.invalidate()
                            progress = 0.0
                        }
                        else{
                            progress += 0.05
                        }/*progress = progress + 0.5*/
                    }
                }
        }
        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}
