//
//  WhaleRow.swift
//  WhalesSwiftUI
//
//  Created by Roberto Hernandez on 2/28/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct WhaleRow: View {
  var whale: Whale
  var namespace: Namespace.ID
  var isSource: Bool
  
  var body: some View {
    VStack(alignment: .center, spacing: 16) {
      WebImage(url: whale.image)
        .resizable()
        .matchedGeometryEffect(id: "image/\(whale.id)", in: namespace, isSource: isSource)
        .aspectRatio(contentMode: .fit)
      
      Text(whale.name)
        .matchedGeometryEffect(id: "name/\(whale.id)", in: namespace, isSource: isSource)
        .font(Font.subheadline.bold())
        .shadowModifier(.primary)
    }
  }
}
