//
//  ShareSheet.swift
//  RecordingScreen
//
//  Created by Huy Hoang Nguyen on 04/02/2022.
//

import SwiftUI

// MARK: UIKit Share Sheet
struct ShareSheet: UIViewControllerRepresentable {
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
