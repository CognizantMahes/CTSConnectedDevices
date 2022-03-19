//
//  CTSConnectedDeviceManager.swift
//  CTSConnectedDevices
//
//  Created by C, Maheswaran (Cognizant) on 14/03/22.
//

import Foundation
public class CTSConnectedDeviceManager {
    let bleMaagr: CTSBLEManager = CTSBLEManager()
   public init(){
        print("init succeess")
    }
    public func start() {
       // let bleMaagr =  CTSBLEManager()
        bleMaagr.startScannForPeriphirals()
    }
    public func startScan(){
        bleMaagr.startScannForPeriphirals()
    }
    
    public func printTestMethod(){
        print("TestMethod()")
        bleMaagr.pritArray()
    }
    private func samplemethod(){
        print("Sample()")
    }
}
