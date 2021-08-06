//
//  Intro.swift
//  Intro
//
//  Created by nyannyan0328 on 2021/08/06.
//

import SwiftUI

struct Intro: Identifiable {
    var id = UUID().uuidString
    var image : String
    var title : String
    var discription : String
    var color : Color
    
}

var intros : [Intro] = [


    Intro(image: "pic1", title: "Choooooose", discription: "The best in Dog", color: Color("Blue")),

    Intro(image: "pic2", title: "Find the best Pet", discription: "Find it!", color: Color("Pink")),

    Intro(image: "pic2", title: "Yeah,Son Pet", discription: "I'm going to happy", color: Color("Yellow")),





]



