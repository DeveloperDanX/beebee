//
//  Obstacle.swift
//  BeeBee
//
//  Created by Dan Petre on 24/2/21.
//

import SwiftUI

struct Obstacle: View {
    
    let width: CGFloat = 20
    let height: CGFloat = 200
    
    
    var body: some View {
        Rectangle()
            .frame(width: width, height: height)
            .foregroundColor(.green)
    }
}

struct Obstacle_Previews: PreviewProvider {
    static var previews: some View {
        Obstacle()
    }
}
