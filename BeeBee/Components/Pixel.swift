//
//  Pixel.swift
//  BeeBee
//
//  Created by Dan Petre on 24/2/21.
//

import SwiftUI


struct Pixel: View {
    let size: CGFloat
    let color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: size, height: size)
            .foregroundColor(color)
        
    }
}
