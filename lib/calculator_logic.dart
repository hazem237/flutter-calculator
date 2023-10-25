Map<String, dynamic> calculateResult(
  String buttonText,
  String output,
  double num1,
  double num2,
  String operand,
) {
  double newNum1 = num1;
  double newNum2 = num2;
  String newOperand = operand;
  String newOutput = output;

  switch (buttonText) {
    case "C":
      newOutput = "0";
      newNum1 = 0;
      newNum2 = 0;
      newOperand = "";
      break;
    case "+":
    case "-":
    case "*":
    case "/":
      newNum1 = double.parse(output);
      newOperand = buttonText;
      newOutput = "0";
      break;
    case "=":
      newNum2 = double.parse(output);
      switch (operand) {
        case "+":
          newOutput = (newNum1 + newNum2).toString();
          break;
        case "-":
          newOutput = (newNum1 - newNum2).toString();
          break;
        case "*":
          newOutput = (newNum1 * newNum2).toString();
          break;
        case "/":
          if (newNum2 != 0) {
            newOutput = (newNum1 / newNum2).toString();
          } else {
            newOutput = "Error";
          }
          break;
        default:
          newOutput = "Error";
      }
      newNum1 = 0;
      newNum2 = 0;
      newOperand = "";
      break;
    default:
      newOutput += buttonText;
      break;
  }

  return {
    'output': newOutput,
    'num1': newNum1,
    'num2': newNum2,
    'operand': newOperand,
  };
}
