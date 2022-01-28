//
//  ContentView.swift
//  Shared
//
//  Created by Broc Pashia on 01/21/22.
//
//  1st Version with code written poorly and radius hard coded to 5.0
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        let rad = 5.0;
        let volume = (4.0/3.0)*Double.pi*pow(rad,3)
        let sphereSurfaceArea = 4.0*Double.pi*pow(rad,2)
        let boundingBoxVolume = pow(2*rad,3)
        let boundingBoxSurfaceArea = pow(2*rad,2)*6
        
        VStack{
            Text("Radius")
                .padding(.top)
                .padding(.bottom, 0)
            Text("\(rad, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            HStack {
                VStack{
            Text("Sphere Volume")
                .padding(.bottom, 0)
            Text("\(volume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Sphere S.A.")
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
            Text("Bounding Box Volume")
                .padding(.bottom, 0)
            Text("\(boundingBoxVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
        }
        VStack{
            Text("Bounding Box S.A.")
                .padding(.bottom, 0)
            Text("\(boundingBoxSurfaceArea, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            }
            }
            

            
            
        }
        
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
