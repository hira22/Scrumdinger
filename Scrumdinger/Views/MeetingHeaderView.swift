//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by hiraoka on 2021/02/05.
//

import SwiftUI
import AVFoundation

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondRemaining: Int
    
    private var progress: Double {
        guard secondRemaining > 0 else { return 1 }
        let totalSeconds = Double(secondsElapsed + secondRemaining)
        return Double(secondsElapsed) / totalSeconds
    }
    
    let scrumColor: Color
    
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(scrumColor: scrumColor))
            HStack {
                VStack(alignment: .leading) {
                    Text("Second Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Second Remaining")
                        .font(.caption)
                    HStack {
                        Text("\(secondRemaining)")
                        Image(systemName: "hourglass.tophalf.fill")
                    }
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Time remaining"))
        .accessibilityValue(Text("\(minutesRemaining) \(minutedRemainingMetric)"))
        .padding([.top, .horizontal])
    }
}

// MARK: Accessibility
extension MeetingHeaderView {
    private var minutesRemaining: Int {
        secondRemaining / 60
    }
    private var minutedRemainingMetric: String {
        minutesRemaining == 1 ? "minute" : "minutes"
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondRemaining: 180, scrumColor: DailyScrum.data.first!.color)
            .previewLayout(.sizeThatFits)
    }
}
