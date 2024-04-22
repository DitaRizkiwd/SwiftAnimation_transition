//
//  TransitionView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct TransitionView: View {
    @State private var show = false
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.cyan)
                .overlay{
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                }
                
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.cyan)
                //                    .transition(.scale(scale: 0, anchor: .bottom))
//                    .transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity))
                    .transition(.offsetScaleOpacity)
                    .overlay{
                        Text("Well, it goes like this!")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                }

                    
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut){
                show.toggle()
            }
        }
    }
}

#Preview {
    TransitionView()
}
extension AnyTransition{
    static var offsetScaleOpacity : AnyTransition{
//        AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}
