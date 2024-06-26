//
//  FancyButton.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct FancyButton: View {
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 240 : 200, height: 60)
                .foregroundStyle(completed ? .blue : .cyan)
                .animation(.spring, value: processing)
            
            if !processing{
                Text("Submit")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
                }
            
            if processing && !completed{
                HStack(spacing : 12){
                        Circle()
                            .trim(from: 0, to: 0.7)
                            .stroke(Color.white, lineWidth: 3)
                            .frame(width: 24, height: 24)
                            .rotationEffect(.degrees(loading ? 360 : 0))
                            .animation(.easeOut.repeatForever(autoreverses: false), value: loading)
                        
                        Text("Processing")
                            .font(.system(.title, design: .rounded))
                            .foregroundStyle(.white)
                    }
                    .transition(.opacity)
                    .onAppear{
                        startProcessing()
                    }
                }
            if completed{
                Text("Done")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .onAppear(){
                        withAnimation(.default){
                            endProcessing()
                        }
                    }
            }
            }
        .animation(.spring, value: loading)
        .onTapGesture {
            if !loading{
                processing.toggle()
            }
           
        }
    }
}

#Preview {
    FancyButton()
}

extension FancyButton{
    func startProcessing(){
        loading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            completed = true
        }
    }
    func endProcessing(){
        DispatchQueue.main.asyncAfter(deadline: .now()+1){
            processing = false
            completed = false
            loading = false
        }
    }
}
