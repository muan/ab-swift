let numbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
let answer = String(numbers.shuffled().prefix(4))
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
    let correctPositions = zip(guess, answer).filter(==).count
    let correctDigits = Set(guess)
        .map { character in
            answer.filter { $0 == character }.count
        }
        .reduce(0, +)

    return "A\(correctPositions)B\(correctDigits - correctPositions)"
}
