import Foundation

// Data Model for Mobile App
struct MobileApp {
    let name: String
    let category: String
    let rating: Double
    let downloads: Int
}

// Data Analyzer Class
class DataAnalyzer {
    var apps: [MobileApp] = []
    
    func addApp(_ app: MobileApp) {
        apps.append(app)
    }
    
    func getTopRatedApp() -> MobileApp? {
        return apps.max { $0.rating < $1.rating }
    }
    
    func getMostDownloadedApp() -> MobileApp? {
        return apps.max { $0.downloads < $1.downloads }
    }
    
    func getAppsWithDownloadsGreaterThan(_ threshold: Int) -> [MobileApp] {
        return apps.filter { $0.downloads > threshold }
    }
}

// Test Case
let analyzer = DataAnalyzer()

let app1 = MobileApp(name: "Facebook", category: "Social", rating: 4.5, downloads: 1000000)
let app2 = MobileApp(name: "Instagram", category: "Social", rating: 4.8, downloads: 5000000)
let app3 = MobileApp(name: "Twitter", category: "Social", rating: 4.2, downloads: 2000000)

analyzer.addApp(app1)
analyzer.addApp(app2)
analyzer.addApp(app3)

print("Top Rated App: \(analyzer.getTopRatedApp()?.name ?? "No apps")")
print("Most Downloaded App: \(analyzer.getMostDownloadedApp()?.name ?? "No apps")")
print("Apps with downloads > 1 million: \(analyzer.getAppsWithDownloadsGreaterThan(1000000).map { $0.name }.joined(separator: ", "))")