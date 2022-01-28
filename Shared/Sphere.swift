//
//  Ellipse.swift
//  CircleUT
//
//  Created by Broc Pashia on 1/21/22
//

import SwiftUI

class Sphere: NSObject, ObservableObject {


    var radiusLength = 0.0
    var centerOfSphere = (x:0.0, y:0.0)
    @Published var volume = 0.0
    @Published var surfaceArea = 0.0
    @Published var volumeText = ""
    @Published var surfaceAreaText = ""
    @Published var boundingBox: BoundingBox=BoundingBox()
    @Published var enableButton = true

    /// initWithRadius Initialized the Sphere and Calculated Volume and the Surface Area of Sphere, as well as calculated values for bounding box
    /// - Parameters:
    ///   - radius: Sphere Radius
    func initWithRadius(radius:Double) async -> Bool {

        radiusLength = radius
        



            let _ = await withTaskGroup(of:  Void.self) { taskGroup in



                taskGroup.addTask { let _ = await self.calculateVolume(radius:self.radiusLength)}
                taskGroup.addTask { let _ = await self.calculateSurfaceArea(radius:self.radiusLength)}
                taskGroup.addTask { let _ = await self.calculateBoundingBox(radius:self.radiusLength)}
        }

            await setButtonEnable(state: true)




        return true

    }


    /// calculateVolume
    /// - Parameters:
    ///   - radius: Radius of sphere
    func calculateVolume(radius: Double) async -> Double {

        //Volume = 4/3 * pi * pow(radius,3)

        let calculatedVolume = 4.0/3.0 * Double.pi * pow(radius,3)
        let newCalculatedVolumeText = String(format: "%7.5f", calculatedVolume)

        await updateVolume(volumeTextString: newCalculatedVolumeText)
        await newVolumeValue(volumeValue: calculatedVolume)

        return calculatedVolume


    }


    /// calculateSurfaceArea
    /// - Parameters:
    ///   - radius: Sphere Radius
    func calculateSurfaceArea(radius: Double) async -> Double {

        //surfaceArea =4 * pi * pow(radius, 2)


        let calculatedSurfaceArea = 4.0*Double.pi * pow(radius,2)
        let newSurfaceAreaText = String(format: "%7.5f", calculatedSurfaceArea)

        await updateSurfaceArea(surfaceAreaTextString: newSurfaceAreaText)
        await newSurfaceAreaValue(surfaceAreaValue: calculatedSurfaceArea)

        return calculatedSurfaceArea

    }
    
    // calculateBoundingBox
    // Stores instance of class BoundingBox on sphere
    /// - Parameters:
    ///   - radius: Radius of sphere
    func calculateBoundingBox(radius: Double) async -> Bool {

        //Volume = 4/3 * pi * pow(radius,3)

        let _ = await boundingBox.initWithSideLength(side: 2.0*radius)
        return true

    }

    /// setButton Enable
    /// Toggles the state of the Enable Button on the Main Thread
    /// - Parameter state: Boolean describing whether the button should be enabled.
    @MainActor func setButtonEnable(state: Bool){


        if state {

            Task.init {
                await MainActor.run {


                    self.enableButton = true
                }
            }



        }
        else{

            Task.init {
                await MainActor.run {


                    self.enableButton = false
                }
            }

        }

    }

    /// updateVolume
    /// Executes on the main thread
    /// - Parameter volumeTextString: Text describing the value of the spherical volume
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
    /// - SurfaceArea     surfaceAreaTextString: Text describing the value of the spherical surface area
    @MainActor func updateSurfaceArea(surfaceAreaTextString:String){

        surfaceAreaText = surfaceAreaTextString


    }

    




}
