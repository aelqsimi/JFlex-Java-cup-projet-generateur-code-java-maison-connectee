prog : parser.class ex2.txt

	java parser < ex2.txt >trace.txt

parser.class : parser.java sym.java Yylex.java

	javac parser.java sym.java Yylex.java

parser.java : base_cup.cup

	java java_cup.Main base_cup.cup

sym.java : base_cup.cup

	java java_cup.Main base_cup.cup

Yylex.java : base_lex.lex

	java JFlex.Main base_lex.lex

clean :

	rm -rf *.class *.java
