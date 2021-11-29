//
//  ContentView.swift
//  GeometryEffectBug
//
//  Created by Maren on 29.11.21.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var changeAngle: Bool  = false
    @State private var changeScale: Bool = false
    
    let rotationAngle3D = Angle(degrees: 70)
    
    var body: some View {
        let height: Double = 40
        let width: Double = 200
            
        
        VStack(spacing: 1) {
            Rectangle()
                .fill(.red)
                .frame(width: width, height: height)
                .rotation3DEffect(rotationAngle3D, axis: (x: 1, y: 0, z: 0))
            Rectangle()
                .fill(.red)
                .frame(width: width, height: height)
        }
        .background(.thinMaterial)
        .scaleEffect(changeScale ? 0.5 : 1)
        .rotationEffect(changeAngle ? Angle(degrees: 50.0) : Angle(degrees: 0.0))
        .offset(self.offset)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    self.offset = CGSize.zero
                }
        )
        .onTapGesture(count: 2) {
            self.changeScale.toggle()
            }
        .onTapGesture(count: 1) {
            self.changeAngle.toggle()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
