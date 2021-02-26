//
//  Bee.swift
//  BeeBee
//
//  Created by Dan Petre on 24/2/21.
//

import SwiftUI

struct Bee: View {
    
    let rows = 10
    let columns = 10
    let heliBlock: [[Color]] = [[.clear, .clear, .black, .black, .clear, .black, .black, .clear, .clear, .clear ],
                                [.clear, .black, .gray, .gray, .black, .gray, .gray, .black, .clear, .clear],
                                [.clear, .clear, .black, .gray, .gray, .black, .gray, .black, .clear, .clear ],
                                [.clear, .clear, .clear, .black, .black, .black, .black, .black, .clear, .clear ],
                                [.clear, .clear, .black, .black, .yellow, .black, .yellow, .yellow, .black, .clear ],
                                [.clear, .black, .yellow, .black, .yellow, .black, .yellow, .yellow, .yellow, .black ],
                                [.black, .black, .yellow, .black, .yellow, .black, .yellow, .black, .yellow, .black ],
                                [.clear, .black, .yellow, .black, .yellow, .black, .yellow, .yellow, .yellow, .black ],
                                [.clear, .clear, .black, .black, .yellow, .black, .yellow, .yellow, .black, .clear ],
                                [.clear, .clear, .clear, .black, .black, .black, .black, .black, .clear, .clear ]
                                
]
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            ForEach((0...self.rows - 1), id: \.self) { row in
                HStack(spacing: 0){
                    ForEach((0...self.columns - 1), id: \.self) { col in
                        VStack(spacing: 0) {
                            Pixel(size: 5, color: self.heliBlock[row][col])
                        }
                    }
                }
            }
        }
    }
}

struct Bee_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Bee()
                .preferredColorScheme(.dark)
        }
    }
}
