//
//  ContentView.swift
//  WhalesSwiftUI
//
//  Created by Roberto Hernandez on 2/28/21.
//

import SwiftUI

struct WhalesStates {
  var selectedWhale: Whale?
  var isShown = false
  var isDisabled = false
}

struct WhalesView: View {
  //Property Wrappers
  @State private var states = WhalesStates()
  @Namespace private var whalesSpace
  
  //Regular Properties
  private let whales = Whale.whales
  private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 2)
  
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        VStack(alignment: .leading) {
          textHeader
          whalesGrid(geometry)
        }
        .zIndex(1)
        .edgesIgnoringSafeArea(.bottom)
        
        if states.selectedWhale != nil {
          whaleSelection
            .zIndex(2)
        }
      }
    }
  }
  
  //MARK:- UI Components to send into body method
  
  var textHeader: some View {
    Text("Whales")
      .font(Font.largeTitle.weight(.bold))
      .padding(10)
      .shadowModifier(.primary)
  }
  
  var whaleSelection: some View {
    WhaleRow(whale: states.selectedWhale!, namespace: whalesSpace, isSource: !states.isShown)
      .matchedGeometryEffect(id: "background/\(states.selectedWhale!.id)", in: whalesSpace, isSource: !states.isShown)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .rowModifier()
      .edgesIgnoringSafeArea(.all)
      .onTapGesture {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
          states.isShown.toggle()
          states.selectedWhale = nil
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            states.isDisabled = false
          }
        }
      }
  }
  
  func whalesGrid(_ proxy: GeometryProxy) -> some View {
    ScrollView {
      LazyVGrid(columns: columns, spacing: 10) {
        ForEach(whales) { whale in
          WhaleRow(whale: whale, namespace: whalesSpace, isSource: !states.isShown)
            .matchedGeometryEffect(id: "background/\(whale.id)", in: whalesSpace, isSource: !states.isShown)
            .frame(width: (proxy.size.width * 0.5) - 10, height: (proxy.size.height * 0.45), alignment: .center)
            .rowModifier()
            .onTapGesture {
              withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                states.isShown.toggle()
                states.selectedWhale = whale
                states.isDisabled = true
              }
            }
            .disabled(states.isDisabled)
        }
      }
      .padding(10)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      WhalesView()
      WhalesView()
        .preferredColorScheme(.dark)
    }
  }
}
