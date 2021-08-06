//
//  ContentView.swift
//  UI-281
//
//  Created by nyannyan0328 on 2021/08/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader{proxy in
            
            
            let size = proxy.size
            Home(screenSize: size)
                .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
