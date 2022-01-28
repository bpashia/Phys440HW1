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
    
    @ObservedObject private var sphereModel = Sphere()
    @State var radiusString = "0.0"
    
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
                        Text("\(sphereModel.volume, specifier: "%.2f")")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
            }
            VStack{
                Text("Sphere S.A.").underline()
                    .padding(.bottom, 0)
                Text("\(sphereModel.surfaceArea, specifier: "%.2f")")
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
                        Text("\(sphereModel.boundingBox.volume, specifier: "%.2f")")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .padding(.top, 0)
                    .padding(.bottom,30)
                
            }
            VStack{
                Text("Bounding Box S.A.").underline()
                    .padding(.bottom, 0)
                Text("\(sphereModel.boundingBox.surfaceArea, specifier: "%.2f")")
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
          
          sphereModel.setButtonEnable(state: false)
          
          let _ : Bool = await sphereModel.initWithRadius(radius: Double(radiusString)!)
          
          
      

  }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
