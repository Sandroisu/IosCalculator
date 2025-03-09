import Foundation

enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case nothing = ""
}

enum CalculationState: String {
    case enteringNumber = "enteringNumber"
    case newNumStarted = "newNumStarted"
}
