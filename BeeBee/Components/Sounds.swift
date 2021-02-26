//
//  Sounds.swift
//  BeeBee
//
//  Created by Dan Petre on 24/2/21.
//

import AVFoundation

 class Sounds {

   static var audioPlayer:AVAudioPlayer?

    static func playSounds(soundfile: String, numberOfLoops: Int = 0) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil){

           do{

               audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               audioPlayer?.prepareToPlay()
               audioPlayer?.play()
               audioPlayer?.numberOfLoops = numberOfLoops

           }catch {
               print("Error")
           }
       }
    }
 }
