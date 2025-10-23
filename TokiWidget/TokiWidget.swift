import WidgetKit
import SwiftUI

struct TokiWidgetEntry: TimelineEntry {
    let date: Date
    let libraryOccupancy: Int
    let nextShuttle: Int
}

struct TokiWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> TokiWidgetEntry {
        TokiWidgetEntry(date: Date(), libraryOccupancy: 65, nextShuttle: 5)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TokiWidgetEntry) -> Void) {
        completion(TokiWidgetEntry(date: Date(), libraryOccupancy: 65, nextShuttle: 5))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TokiWidgetEntry>) -> Void) {
        let entry = TokiWidgetEntry(date: Date(), libraryOccupancy: 65, nextShuttle: 5)
        let timeline = Timeline(entries: [entry], policy: .after(Date().addingTimeInterval(300)))
        completion(timeline)
    }
}

struct TokiWidgetView: View {
    let entry: TokiWidgetEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("toki")
                .font(.caption)
                .fontWeight(.bold)
            
            HStack {
                Image(systemName: "books.vertical")
                Text("\(entry.libraryOccupancy)%")
            }
            .font(.caption2)
            
            HStack {
                Image(systemName: "bus")
                Text("\(entry.nextShuttle) min")
            }
            .font(.caption2)
        }
        .padding()
    }
}
