import UIKit

enum Animal: String, CaseIterable {
    case cat
    case cow
    case wolf
    case horse
    case eagle
    case chicken
    case duck
    //あとから1パターン追加させる
    
    static let mammals: [Animal] = [.cat, .cow, .wolf, .horse]
    static let birds: [Animal] = [.eagle, .chicken, .duck]
    
    var name: String {
        switch self {
        case .cat:
            "猫"
        case .cow:
            "うし"
        case .wolf:
            "オオカミ"
        case .horse:
            "馬"
        case .eagle:
            "ワシ"
        case .chicken:
            "にわとり"
        case .duck:
            "アヒル"
        }
    }
    
    var iconName: String {
        "icon_\(rawValue)"
    }
    
    var imageName: String {
        "image_\(rawValue)"
    }
    
    var sound: Data {
        NSDataAsset(name: "sound_\(rawValue)")!.data
    }
}
