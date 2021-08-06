//
//  OffsetModeifier.swift
//  OffsetModeifier
//
//  Created by nyannyan0328 on 2021/08/06.
//

import SwiftUI

struct OffsetModeifier<Content : View>: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return OffsetModeifier.Coordinator(parent: self)
    }
    
    var content : Content
    @Binding var offset : CGFloat
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        self._offset = offset
        self.content = content()
        
        
    }
    
    let scroll = UIScrollView()
    
    func makeUIView(context: Context) -> UIScrollView {
        
        setUp(scroll: scroll)
        
        scroll.delegate = context.coordinator
        
        return scroll
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        let contentOffset = uiView.contentOffset.x
        
        if offset != contentOffset{
            
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
        
    }
    
    func setUp(scroll : UIScrollView){
        
        
        let hostView = UIHostingController(rootView: content)
        
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constains = [
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
           hostView.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
            
           
        
        
        ]
        
        scroll.addConstraints(constains)
        scroll.addSubview(hostView.view)
        scroll.isPagingEnabled = true
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        
        
    }
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        
        var parent : OffsetModeifier
        
        init(parent : OffsetModeifier) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            
            parent.offset = offset
        }
    }
}

struct OffsetModeifier_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
