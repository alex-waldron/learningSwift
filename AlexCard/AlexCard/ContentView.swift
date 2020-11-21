//
//  ContentView.swift
//  AlexCard
//
//  Created by Alex Waldron on 11/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            VStack {
                Image("XtraRepLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                Text("Alex Waldron")
                    .font(Font.custom("BigShouldersStencilDisplay-Black", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("XtraRep- Founder")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(icon: "phone.fill", text: "+1 732-503-6455")
                InfoView(icon: "envelope.fill", text: "awaldron@xtrarepapp.com")
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


