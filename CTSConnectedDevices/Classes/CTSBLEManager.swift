//
//  CTSBLEManager.swift
//  CTSConnectedDevices
//
//  Created by C, Maheswaran (Cognizant) on 14/03/22.
//

import Foundation
import CoreBluetooth
internal class CTSBLEManager: NSObject {
    var centralManager: CBCentralManager!
    var peripheralList: [CBPeripheral] = []
    override init(){
        super.init()
        print("BLE")
        centralManager = CBCentralManager(delegate: self, queue: nil)
        centralManager.delegate = self
    }
    func startScannForPeriphirals() {
        centralManager.scanForPeripherals(withServices: nil)
    }
    func pritArray(){
        print(peripheralList)
    }
}

extension CTSBLEManager: CBCentralManagerDelegate {
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    switch central.state {
    case .unknown:
      print("central.state is .unknown")
    case .resetting:
      print("central.state is .resetting")
    case .unsupported:
      print("central.state is .unsupported")
    case .unauthorized:
      print("central.state is .unauthorized")
    case .poweredOff:
      print("central.state is .poweredOff")
    case .poweredOn:
      print("central.state is .poweredOn")
      centralManager.scanForPeripherals(withServices: [])
    }
  }

  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral,
                      advertisementData: [String : Any], rssi RSSI: NSNumber) {
    print(peripheral)
      if peripheralList.contains(peripheral)  {
                  print("Duplicate Found.")
                  // peripheralArray.replaceObject(at: peripheral.index(ofAccessibilityElement: ), withObject: <#T##ObjectType#>)
              } else if let name = peripheral.name {
                  peripheralList.append(peripheral)
                  //rssiArray.append(RSSI)
                  //var peripheralObj = CTSPeripheral()
                  //peripheralObj.name = name
                  //peripheralObj.peripheral = peripheral
                  //peripheralList.append(peripheralObj)
                  print("peripheral",peripheral)
                  print("advertisementData:",advertisementData)
              } else {
                  print("unable to add , hence namme is empty")
              }
    
  }

  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
    print("Connected!")
   
  }
}
