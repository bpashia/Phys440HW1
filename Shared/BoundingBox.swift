//
//  Ellipse.swift
//  CircleUT
//
//  Created by Broc Pashia on 1/21/22
//

import SwiftUI

class BoundingBox: NSObject, ObservableObject {


    var sideLength = 0.0
    var centerOfBox = (x:0.0, y:0.0)
    @Published var volume = 0.0
    @Published var surfaceArea = 0.0
    @Published var volumeText = ""
    @Published var surfaceAreaText = ""

    /// initWithSideLength   Initialized the Bounding box with values for volume and surface area
    /// - Parameters:
    ///   - side: side length of sphere
    func initWithSideLength(side:Double) async -> Bool {

        sideLength = side
        



            let _ = await withTaskGroup(of:  Void.self) { taskGroup in



                taskGroup.addTask { let _ = await self.calculateVolume(side:self.sideLength)}
                taskGroup.addTask { let _ = await self.calculateSurfaceArea(side:self.sideLength)}
        }





        return true

    }


    /// calculateVolume
    /// - Parameters:
    ///   - side: side length of bounding box
    func calculateVolume(side: Double) async -> Double {

        //Volume = pow(side, 3)

        let calculatedVolume = pow(side, 3)
        let newCalculatedVolumeText = String(format: "%7.5f", calculatedVolume)

        await updateVolume(volumeTextString: newCalculatedVolumeText)
        await newVolumeValue(volumeValue: calculatedVolume)

        return calculatedVolume


    }


    /// calculateSurfaceArea
    /// - Parameters:
    ///   - side: side length of bounding box
    func calculateSurfaceArea(side: Double) async -> Double {

        //surfaceArea = pow(side,2)*6


        let calculatedSurfaceArea = pow(side,2)*6.0
        let newSurfaceAreaText = String(format: "%7.5f", calculatedSurfaceArea)

        await updateSurfaceArea(surfaceAreaTextString: newSurfaceAreaText)
        await newSurfaceAreaValue(surfaceAreaValue: calculatedSurfaceArea)

        return calculatedSurfaceArea

    }

    /// updateVolume
    /// Executes on the main thread
    /// - Parameter volumeTextString: Text describing the value of the cubical volume
    @MainActor func updateVolume(volumeTextString: String){

        volumeText = volumeTextString

    }

    @MainActor func newVolumeValue(volumeValue: Double){

        self.volume = volumeValue

    }

    @MainActor func newSurfaceAreaValue(surfaceAreaValue: Double){

        self.surfaceArea = surfaceAreaValue

    }

    /// updateSurfaceArea
    /// Executes on the main thread
    /// - SurfaceArea     surfaceAreaTextString: Text describing the value of the cubical surface area
    @MainActor func updateSurfaceArea(surfaceAreaTextString:String){

        surfaceAreaText = surfaceAreaTextString


    }

    




}
