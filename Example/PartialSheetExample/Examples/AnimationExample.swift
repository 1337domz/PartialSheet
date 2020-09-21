//
//  NormalExample.swift
//  PartialSheetExample
//
//  Created by Andrea Miotto on 29/4/20.
//  Copyright © 2020 Swift. All rights reserved.
//

import SwiftUI

struct AnimationExample: View {

    @EnvironmentObject var partialSheetManager : PartialSheetManager
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                self.partialSheetManager.showPartialSheet({
                     print("animation sheet dismissed")
                }) {
                     AnimationSheetView()
                }
            }, label: {
                Text("Display the Partial Sheet")
            })
                .padding()
            Spacer()
        }
        .navigationBarTitle("Animation Example")
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnimationExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimationExample()
        }
        .addPartialSheet()
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(PartialSheetManager())
    }
}

struct AnimationSheetView: View {
    
    @State private var buttonText = "Tap me to animate"

    var body: some View {
        VStack {
            Text(buttonText)
                .padding()
                .background(Color.green)
                .cornerRadius(5)
                .onTapGesture {
                    withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.2)) {
                        if buttonText == "Tap me to animate" {
                            buttonText = "Tap again!"
                        } else {
                            buttonText = "Tap me to animate"
                        }
                    }
                }
        }
    }
}
