import Foundation

let noteName = NSNotification.Name("com.betterdisplay.BetterDisplay.osd")
let cli = "/opt/homebrew/bin/sketchybar" // Make sure this path is correct

DistributedNotificationCenter.default().addObserver(forName: noteName, object: nil, queue: nil) { note in
    if let jsonString = note.object as? String {
        let task = Process()
        task.launchPath = cli
        // Trigger the event 'bd_update' and pass the JSON in \$INFO
        task.arguments = ["--trigger", "bd_update", "INFO=\(jsonString)"]
        task.launch()
    }
}

RunLoop.main.run()
