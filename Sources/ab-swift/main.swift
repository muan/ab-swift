let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
let answer = String(numbers.shuffled().prefix(3))
var guess = ""

while guess != answer {
    print("guess")
    guess = readLine()!
    guard guess.allSatisfy(\.isNumber) && guess.count == 4 else {
        print("4 numbers please")
        continue
    }
    print(compare(guess: guess))
}
print("gj")

func compare(guess: String) -> String {
    var aCount = 0
    var bCount = 0
    var guessed: [String] = []
    for indexInGuess in guess.indices {
        let num = String(guess[indexInGuess])
        let indexInAnswer = answer.firstIndex(of: guess[indexInGuess])
        if indexInAnswer == nil { continue }
        if indexInGuess == indexInAnswer {
            if (guessed.contains(num)) {
                bCount -= 1
            }
            aCount += 1
        } else if !guessed.contains(num) {
            bCount += 1
        }
        guessed = guessed + [num]
    }

    return "A\(aCount)B\(bCount)"
}
