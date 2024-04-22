//
//  ExcerciseView.swift
//  SwiftAnimation
//
//  Created by MACBOOK PRO on 22/04/24.
//

import SwiftUI

struct ExcerciseView: View {
    @State private var isShow = false
    @State private var isLoading = false
    var body: some View {
        VStack{
            Image(systemName: "star.fill")
                .font(.system(size: 100))
            
            if isShow {
                Text("5.0 ⭐️")
                    .padding()
                    .transition(.offset(x: 0, y: -50).combined(with: .opacity))
                
            }
            if !isShow {
                HStack{
                    ForEach(1...5, id: \.self){
                        item in Circle()
                            .frame(width: 16, height: 16)
                            .foregroundColor(isLoading ? .green : .gray)
                            .scaleEffect(isLoading ? 1.0 : 0.4)
                            .animation(.linear(duration: 0.6).repeatForever().delay(0.2*Double(item)), value: isLoading)
                    }
                    
                    
                }
                
            }
            
        }
        .animation(.default, value: isShow)
        .onTapGesture {
            startProcessing()
            isLoading.toggle()
        }
//        .onAppear{
//            isLoading.toggle()
//        }
    }
}

#Preview {
    ExcerciseView()
}
extension ExcerciseView{
    func startProcessing(){
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            isShow.toggle()
        }
    }
}
