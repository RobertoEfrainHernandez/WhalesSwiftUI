//
//  WhaleRowModifier.swift
//  WhalesSwiftUI
//
//  Created by Roberto Hernandez on 2/28/21.
//

import SwiftUI

struct WhaleRowModifier: ViewModifier {
  private var gradient: LinearGradient {
    let gradient = Gradient(colors: [Color("TopColor"), Color("BottomColor")])
    let linearGradient = LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
    return linearGradient
  }
  
  func body(content: Content) -> some View {
    content
      .padding(.bottom, 10)
      .background(gradient)
      .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
      .shadowModifier()
  }
}

struct ShadowModifier: ViewModifier {
  var color: Color
  
  func body(content: Content) -> some View {
    content
      .shadow(color: color.opacity(0.3), radius: 4, x: 0, y: 4)
      .shadow(color: color.opacity(0.2), radius: 2, x: 0, y: 1)
  }
}

extension View {
  func rowModifier() -> some View {
    self.modifier(WhaleRowModifier())
  }
  
  func shadowModifier(_ color: Color = .black) -> some View{
    self.modifier(ShadowModifier(color: color))
  }
}
