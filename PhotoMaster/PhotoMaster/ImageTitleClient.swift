import Foundation
import UIKit
import GoogleGenerativeAI

/// AI画像タイトル生成クライアント
/// 画像を渡すと、AI側で短いタイトルを生成して返す
final class ImageTitleClient {
    private let apiKey: String
    private let model: GenerativeModel
    
    init(modelID: String = "gemini-2.0-flash", session: URLSession = .shared) {
        guard let path = Bundle.main.path(forResource: "Secrets", ofType: "plist"),
              let dict = NSDictionary(contentsOfFile: path),
              let apiKey = dict["GEMINI_API_KEY"] as? String else {
            fatalError("環境変数 GEMINI_API_KEY または GOOGLE_API_KEY が設定されていません。")
        }
        self.apiKey = apiKey
        self.model = GenerativeModel(name: "gemini-1.5-flash", apiKey: apiKey)
    }
    
    
    func generateTitle(from image: UIImage) async throws -> String {
        let prompt = """
            画像の内容を短いタイトルにしてください。
            短いタイトル以外出力しないでください。
        """
        let response = try await model.generateContent(prompt, image)
        if let text = response.text {
            return text
        } else {
            throw ClientError.invalidResponse
        }
    }
}
// MARK: - エラー定義
extension ImageTitleClient {
    enum ClientError: Error {
        case invalidResponse
    }
}
