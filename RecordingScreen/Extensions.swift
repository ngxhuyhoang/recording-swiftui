//
//  Extensions.swift
//  RecordingScreen
//
//  Created by Huy Hoang Nguyen on 04/02/2022.
//

import SwiftUI
import ReplayKit

// MARK: App Recording Extensions
extension View {
    // MARK: Start Recording
    func startRecording(enableMicrophone: Bool = false, completion: @escaping (Error?) -> ()) {
        let recorder = RPScreenRecorder.shared()
        
        // Microphone Option
        recorder.isMicrophoneEnabled = false
        
        // Starting Recording
        recorder.startRecording(handler: completion)
    }
    
    // MARK: Stop Recording
    // It will return the Recorded Video URL
    func stopRecording() async throws -> URL {
        // File will be stored in Temporary Directory
        // Video name
        let name = UUID().uuidString + ".mov"
        
        let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
        let recorder = RPScreenRecorder.shared()
        
        try await recorder.stopRecording(withOutput: url)
        
        return url
    }
    
    // MARK: Cancel Recording
    func cancelRecording() {
        let recorder = RPScreenRecorder.shared()
        recorder.discardRecording {}
    }
    
    // MARK: Share Sheet
    func shareSheet(show: Binding<Bool>, items: [Any?]) -> some View {
        return self.sheet(isPresented: show) {
            
        } content: {
            // Wrapping the Optionals
            let items = items.compactMap { item -> Any? in
                return item
            }
            
            if !items.isEmpty {
                ShareSheet(items: items)
            }
        }
    }
}
