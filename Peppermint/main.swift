//
//  main.swift
//  Peppermint
//
//  Created by Jason Antwi-Appah on 9/18/22.
//

// ✨ SET THIS ✨
let displays: UInt32 = 0
// ✨ DON'T TOUCH BELOW HERE :)

import Foundation
import CaffeineKit

let bytesPointer = UnsafeMutableRawPointer.allocate(byteCount: 2, alignment: 1)
bytesPointer.storeBytes(of: 0xFF_FF, as: UInt16.self)


let caf = Caffeination(withOpts: [.idle, .display])

var coffee = false {
	didSet {
		if coffee {
			do {
				let c = try caf.closure {
					(bruh: Int) -> Void in
					while coffee {}
					return
				}
				c(1)
			} catch {
				print("Bruh")
			}
		}
	}
}

CGDisplayRegisterReconfigurationCallback({
	(display: CGDirectDisplayID, flags: CGDisplayChangeSummaryFlags, _: UnsafeMutableRawPointer?) -> Void in print(display, flags)
	if displays == display {
		switch (flags) {
			case .addFlag:
				coffee = true
			case .removeFlag:
				coffee = false
			default:
				print("yea")
		}
	}
}, bytesPointer)


while true {
	
}


