# Compiler Lab Programs

Compiler Lab inte Kurchu Programs 😃
Code isttappettaal Star and Follow 😁😅

## Project Structure

```
├── README.md
├── calculator/
│   ├── calc.l          # Lex file for calculator lexer
│   └── calc.y          # Yacc file for calculator parser
├── ConstantPropagation/
│   ├── const.c         # Constant propagation implementation
│   ├── input.txt       # Sample input for constant propagation
│   └── TestCase.txt    # Test cases for constant propagation
├── IntermediateCode/
│   └── incode.c        # Intermediate code generation implementation
├── lexicalAnalyzer/
│   ├── lexicalAnalyzerC/
│   │   ├── Analyzer.c  # Manual lexical analyzer in C
│   │   └── input.txt   # Sample input for lexical analyzer
│   └── lexicalAnalyzerLex/
│       ├── Analyzer.l  # Lexical analyzer using Flex
│       └── input.txt   # Sample input for lexical analyzer
├── RecursiveDecentParser/
│   └── parser.c        # Recursive descent parser implementation
├── SampleLexPrograms/
│   ├── evenOrOdd/
│   │   └── evenOrOdd.l # Lex program to check even/odd numbers
│   ├── FlamesGame/
│   │   └── FlamesGame.l # Lex program for FLAMES game
│   ├── InGeneral/
│   │   └── InGeneral.l # Template Lex program for custom functions
│   ├── NumberOfCharacters/
│   │   └── character.l # Lex program to count number of characters
│   ├── Palindrome/
│   │   └── palindrome.l # Lex program to check palindromes
│   └── PrimeNumber/
│       └── prime.l     # Lex program to check prime numbers
├── ShiftReduceParser/
│   ├── info.txt        # Information about shift-reduce parser
│   ├── input.txt       # Sample input for shift-reduce parser
│   ├── parserSimpleLogic.c # Simple logic shift-reduce parser
│   └── parserUsingExternalFile.c # Shift-reduce parser using external file
└── yaccPrograms/
    ├── ValidExp/
    │   ├── ValidExp.l  # Lex file for valid expression
    │   └── ValidExp.y  # Yacc file for valid expression
    └── ValidIdentifier/
        ├── Valid.l     # Lex file for valid identifier
        └── Valid.y     # Yacc file for valid identifier
```

## Notes

- Oru karyam ondu maximum ee programs run cheythu nokkane Errors okke eppozha vandiyum vilichu varunnathu ennu parayan pattathilla
- Ee programs run cheyyumbol enthenkilum Sambhavichal athinte utharavathi ithu cheytha njan alla ennu ariyichu kollunnu😁

## How to run
### Program having both LEX and YACC programs
```
bison -d fileName.y  
flex fileName.l        
gcc lex.yy.c y.tab.c -o calcn ## YACC inte program run cheyyumbol y.tab.c generate aakunundengil ee command use cheyyaam allengil (fileName.tab.c) ennu use cheyyane
./calc
```

### Program with only LEX file
```
lex fileName.l
gcc lex.yy.c
./a.out
```
### Program with only C Code
Prathyekichu parayandallo 😎
Engaanum Maranittundengil ithaane
```
gcc fileName.c
./a.out
```
## Contributing

Feel free to add more examples or improve existing implementations.
