//
//  Home.swift
//  Home
//
//  Created by nyannyan0328 on 2021/08/06.
//

import SwiftUI

struct Home: View {
    var screenSize : CGSize
    @State var offset : CGFloat = 0
    var body: some View {
        VStack{
            
            
            Button {
                
            } label: {
                Image("pack")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            OffsetModeifier(offset: $offset) {
                
                
                HStack(spacing:0){
                    
                    ForEach(intros){intro in
                        
                        VStack{
                            
                            Image(intro.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: screenSize.height / 3)
                            
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                
                                Text(intro.title)
                                    .font(.largeTitle.bold())
                                
                                Text(intro.discription)
                                    .font(.title2.bold())
                                    .foregroundStyle(.secondary)
                                    
                                
                                
                            }
                            .foregroundStyle(.white)
                            .padding(.top,50)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            
                        }
                        .padding()
                        .frame(width: screenSize.width)
                       
                        
                        
                    }
                }
                .padding()
               
            }
            
            HStack(alignment:.top){
                
                
                HStack(spacing:15){
                    
                    
                    ForEach(intros.indices,id:\.self){index in
                        
                        Capsule()
                            .fill(.white)
                    
                            .frame(width: getIndex() == index ? 20 : 8 , height:8)
                    }
                }
                .overlay(
                
                
                    
                    Capsule()
                        .fill(.white)
                        .frame(width: 20, height: 8)
                        .offset(x: getIndeicatorOffset())
                    
                    ,alignment: .leading
                
                
                )
                .offset(x: 10, y: 15)
                .padding()
                
                
                
                Spacer()
                
                
                HStack(spacing:10){
                    
                    
                    Button {
                        
                        
                        let index = min(BackIndex() - 1, intros.count - 2)
                        
                        offset = CGFloat(index) * screenSize.width
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(20)
                            .background(
                            
                                intros[BackIndex()].color,in: Circle()
                            
                            
                            )
                    }
                    
                    
                    
                    
                    Button {
                        
                        
                        let index = min(getIndex() + 1, intros.count - 1)
                        
                        offset = CGFloat(index) * screenSize.width
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                            .padding(20)
                            .background(
                            
                                intros[getIndex()].color,in: Circle()
                            
                            
                            )
                    }
                }

                
            }
            .padding()

            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .animation(.easeInOut, value: getIndex())
    }
    
    func getIndeicatorOffset()->CGFloat{
        
        
        let progress = offset / screenSize.width
        
        let max : CGFloat = 15 + 8
        
        return progress * max
    }
    
    func getIndex()->Int{
        
        let progress = round(offset / screenSize.width)
        
        let index = min(Int(progress), intros.count - 1)
        
        return index
    }
    
    func BackIndex()->Int{
        
        let progress = round(offset / screenSize.width)
        
        let index = max(Int(progress), intros.count - 2)
        
        return index
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
