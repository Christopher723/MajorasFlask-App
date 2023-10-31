//
//  ContentView.swift
//  MajorasFlask
//
//  Created by Christopher Woods on 10/31/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var Majora = MajoraViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        ZStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing:20){
                    ForEach(Majora.items) { item in
                        VStack{
                            AsyncImage(url: URL(string: "http://127.0.0.1:5000/product/image/\(Majora.getItem(item: item))")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable()
                                                     .aspectRatio(contentMode: .fit)
                                                     .frame(maxWidth: 90, maxHeight: 90)
                                            case .failure:
                                                Image(systemName: "photo")
                                            @unknown default:
                                                
                                                EmptyView()
                                            }
                                        }
                                        Text(item.name)
                                            .onTapGesture{
                                                print(item.description)
                                            }
                                    }
                            
                            
                           
                                
                            
                        }
                    }
                    
                }
            }
        
           
        }
    }


#Preview {
    ContentView()
}
