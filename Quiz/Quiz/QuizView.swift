import SwiftUI

struct QuizView: View {
    @Binding var currentScreen: Screen
    @Binding var score: Int
    @Binding var totalQuestions: Int
    
    // ここにクイズの問題と選択肢、正解を定義します
    let quizItems: [QuizItem] = [
        QuizItem(question: "iPhoneを開発している企業はどこ？", options: ["Google", "Apple", "Samsung"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの共同創業者は誰？（一人選んでください）", options: ["ビル・ゲイツ", "スティーブ・ウォズニアック", "ラリー・ペイジ"], correctAnswerIndex: 1),
        QuizItem(question: "最初のMacintoshが発表された年は？", options: ["1976年", "1984年", "1998年"], correctAnswerIndex: 1),
        QuizItem(question: "Appleの本社があるカリフォルニア州の都市は？", options: ["サンフランシスコ", "パロアルト", "クパチーノ"], correctAnswerIndex: 2),
        QuizItem(question: "SwiftUIが最初に発表されたWWDCの年は？", options: ["2017", "2019", "2021"], correctAnswerIndex: 1)
    ]
    
    @State private var currentQuestionIndex = 0
    @State private var isCorrect: Bool = false
    @State private var isShowingFeedback = false
    
    var currentQuestion: QuizItem {
        quizItems[currentQuestionIndex]
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Apple Quiz")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.white))
                    .padding(.top, 20)
                
                Spacer()
                
                // Question Text
                Text(currentQuestion.question)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color(.white))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .frame(minHeight: 100, alignment: .center)
                
                Spacer()
                
                // Feedback Message Area
                Text(isCorrect ? "正解！" : "不正解... 正解は「\(currentQuestion.options[currentQuestion.correctAnswerIndex])」")
                    .font(.headline)
                    .padding(10)
                    .background(.thinMaterial)
                    .foregroundStyle(Color(isCorrect ? .green : .red))
                    .clipShape(.rect(cornerRadius: 10))
                    .opacity(isShowingFeedback ? 1 : 0)
                
                Spacer()
                
                // Answer Options
                VStack(spacing: 16) {
                    ForEach(0..<currentQuestion.options.count, id: \.self) { index in
                        Button {
                            answerTapped(index)
                        } label: {
                            Text(currentQuestion.options[index])
                                .font(.system(size: 18, weight: .bold))
                                .foregroundStyle(Color(.background))
                                .frame(maxWidth: .infinity, minHeight: 70)
                                .background(.white)
                                .clipShape(.rect(cornerRadius: 10))
                        }
                        .disabled(isShowingFeedback)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            // QuizViewが表示された際に、問題総数をContentViewに伝える
            totalQuestions = quizItems.count
        }
    }
    // ボタンがタップされたときの処理
    func answerTapped(_ index: Int) {
        isShowingFeedback = true
        
        if index == currentQuestion.correctAnswerIndex {
            isCorrect = true
            score += 1
        } else {
            isCorrect = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isShowingFeedback = false
            
            if currentQuestionIndex < quizItems.count - 1 {
                currentQuestionIndex += 1
                isShowingFeedback = false
            } else {
                // 全問終了
                currentScreen = .result
            }
        }
    }
}

// MARK: - Preview
#Preview {
    @Previewable @State var currentScreen: Screen = .quiz
    @Previewable @State var score: Int = 0
    @Previewable @State var totalQuestions: Int = 5
    ZStack {
        Color(.background)
            .ignoresSafeArea()
        QuizView(
            currentScreen: $currentScreen,
            score: $score,
            totalQuestions: $totalQuestions
        )
    }
}

