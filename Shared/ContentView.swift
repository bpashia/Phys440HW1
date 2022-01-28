//
//  ContentView.swift
//  Shared
//
//  Created by Broc Pashia on 01/21/22.
//
//1st Version with code written poorly and radius hard coded to 5.0
//

import SwiftUI

struct ContentView: View {
    
    @State var radiusString = "0.0"
    
    @State var sphereVolume:Double = 0.0
    @State var sphereSurfaceArea:Double = 0.0
    @State var boundingBoxVolume:Double = 0.0
    @State var boundingBoxSurfaceArea:Double = 0.0
    
   var body: some View {
        
        
        
        VStack{
            Text("Radius").underline()
                .padding(.top)
                .padding(.bottom, 0)
               
            TextField("Enter Radius", text: $radiusString, onCommit: {Task.init {await self.calculateSphere()}})
                            .padding(.horizontal)
                            .frame(width: 100)
                            .border(.secondary)
                            .padding(.top, 0)
                            .padding(.bottom, 30)
            HStack {
                VStack{
            Text("Sphere Volume").underline()
                .padding(.bottom, 0)
            Text("\(sphereVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Sphere S.A.").underline()
                .padding(.bottom, 0)
            Text("\(sphereSurfaceArea, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            }
            }
            HStack {
                VStack{
            Text("Bounding Box Volume").underline()
                .padding(.bottom, 0)
            Text("\(boundingBoxVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Bounding Box S.A.").underline()
                .padding(.bottom, 0)
            Text("\(boundingBoxSurfaceArea, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            }
            }
            
            Button("Calculate", action: {Task.init { await self.calculateSphere()}})
                .padding(.bottom)
                .padding()
                
            
            
        }
        
    }
    
    func calculateSphere() async {
        let rad: Double = Double(radiusString) ?? 0.0
        sphereVolume = (4.0/3.0)*Double.pi*pow(rad,3)
         sphereSurfaceArea = 4.0*Double.pi*pow(rad,2)
         boundingBoxVolume = pow(2*rad,3)
         boundingBoxSurfaceArea = pow(2*rad,2)*6
        
        
        
    

}
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
