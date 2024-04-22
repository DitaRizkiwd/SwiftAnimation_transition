//
//  MorphingAnimation.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct MorphingAnimation: View {
    @State private var recordBegin = false
    @State private var recording = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: recordBegin ? 15 : 30)
                .frame(width: recordBegin ? 275 : 60, height: 60)
                .foregroundStyle(.cyan)
                .overlay{
                    Image(systemName: "mic.fill")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 1 : 0.7)
                }
            RoundedRectangle(cornerRadius: recordBegin ? 15 : 35)
                .trim(from: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, to: recordBegin ? 1 : 0.0)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 285 : 70, height: 70)
                .foregroundStyle(.cyan)
        }
        .onTapGesture {
            withAnimation(.default){
                recordBegin.toggle()
                recording.toggle()
            }
        }
    }
}

#Preview {
    MorphingAnimation()
}
