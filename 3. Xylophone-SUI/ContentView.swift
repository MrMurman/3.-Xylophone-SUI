//
//  ContentView.swift
//  3. Xylophone-SUI
//
//  Created by Андрей Бородкин on 19.01.2023.
//

import SwiftUI
import Foundation
import AVFoundation

var player: AVAudioPlayer!

struct ContentView: View {
    
        private var columns: [GridItem] = [GridItem(.flexible())]
    let keys = ["C", "D", "E", "F", "G", "A", "B"]
    let colorIDs: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemIndigo, .systemBlue, .systemPurple]
    let margins: [CGFloat] = [10,20,30,40,50,60,70]
    
    
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(0..<keys.count) { i in
                XyloButton(color: colorIDs[i], key: keys[i], margin: margins[i])
            }
        }
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct XyloButton: View {
    
    var color: UIColor
    var key: String
    var margin: CGFloat
    
    // var soundToPlay
    
    var body: some View {
        Button {
            playSound(sound: key)
        } label: {
            Text(key)
                .frame(width: 350-margin, height: 90, alignment: .center)
                .font(.system(size: 48, weight: .medium))
                .background(Color(color)).foregroundColor(.white)
                .animation(.easeOut)
        }
    }
    
    func playSound(sound: String) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        
        guard let url = url else {return}
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("no sound, bro")
        }
    }
      
}
