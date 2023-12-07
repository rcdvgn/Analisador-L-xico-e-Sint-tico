from antlr4 import *
from JavaScriptLexer import JavaScriptLexer
from JavaScriptParser import JavaScriptParser
from JavaScriptVisitor import JavaScriptVisitor

class JavaScriptMain:

    def __init__(self, input_code):
        self.input_code = input_code

    def run(self):
        input_stream = InputStream(self.input_code)
        lexer = JavaScriptLexer(input_stream)
        token_stream = CommonTokenStream(lexer)
        parser = JavaScriptParser(token_stream)
        tree = parser.program()

        visitor = JavaScriptVisitor()
        result = visitor.visit(tree)
        print(result)

if __name__ == '__main__':
    code1 = """let x = 10;
    const PI = 3.14;
    var message = "Hello, world!";"""

    code2 = """let a = 5;
    let b = 7
    let c = 3
    let result = (a + b) * c - 2 / 4;"""

    code3 = """function multiply(a, b) {
        return a * b;
    }

    let product = multiply(3, 4);
    """

    code4 = """let count = 0;
    while (count < 5) {
        console.log("Count: " + count);
        count = count + 1;
    }"""

    code5 = """let temperature = 25;
    let timeOfDay = "afternoon";

    if (temperature > 30 || timeOfDay === "morning") {
        console.log("It might be hot outside or it's morning.");
    } if (temperature <= 30 && timeOfDay === "afternoon") {
        console.log("It's a comfortable temperature in the afternoon.");
    } else {
        console.log("Conditions don't match.");
    }
    """

    testes = [code1, code2, code3, code4, code5]

    for i, teste in enumerate(testes):
        js_main = JavaScriptMain(teste)
        if js_main.run() == None:
            print(f"Teste {i+1} - Sucesso")
        else:
            print(f"Teste {i+1} - Fracasso")