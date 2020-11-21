//
//  InfoView.swift
//  AlexCard
//
//  Created by Alex Waldron on 11/21/20.
//

import SwiftUI

struct InfoView: View {
    let icon: String
    let text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.white)
            .frame(height: 50, alignment: .center)
            .overlay(
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(.blue)
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                    
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(icon: "phone.fill", text: "hello")
            .previewLayout(.sizeThatFits)
    }
}
