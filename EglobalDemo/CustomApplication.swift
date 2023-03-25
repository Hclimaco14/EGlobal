//
//  CustomApplication.swift
//  EglobalDemo
//
//  Created by Hector Climaco on 25/03/23.
//

import Foundation
import UIKit

let toleranceToBlock:Double = 60

class CustomApplication: UIApplication {
    private var timerToDetectInactivity: Timer?
    private var showScreenSaverInSeconds: TimeInterval {
        return TimeInterval(toleranceToBlock)
    }
    
    override func sendEvent(_ event: UIEvent) {
        if let touches = event.allTouches {
            for touch in touches where touch.phase == UITouch.Phase.began {
                self.resetTimer()
            }
        }
        super.sendEvent(event)
    }
    
    // reset the timer because there was user event
    private func resetTimer() {
        if let timerToDetectInactivity = timerToDetectInactivity {
            timerToDetectInactivity.invalidate()
            self.timerToDetectInactivity = nil
        }
        
        timerToDetectInactivity = Timer.scheduledTimer(timeInterval: Double(showScreenSaverInSeconds),
                                                       target: self,
                                                       selector: #selector(CustomApplication.showBlockScreen),
                                                       userInfo: nil,
                                                       repeats: false
        )
    }
    
    @objc private func showBlockScreen() {
        let vc = LoginViewController()
        let navController = UINavigationController(rootViewController: vc)
        
        UIApplication.shared.keyWindow?.rootViewController = navController
    }
}
