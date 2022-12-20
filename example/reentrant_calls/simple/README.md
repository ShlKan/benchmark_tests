This directory contains a small example for modeling
re-entrant calls in file `simple.sol`.

Follow these steps to get it up and running:
1. Compile the Solidity source file:
```
solc-select use 0.8.12
solc simple.sol --combined-json ast --pretty-json > simple_ast.json
```
Now the AST should be available in file `simple_ast.json`

2. Translate the file + the specification into Boogie:
```
VeriSol simple_ast.json /solc:0.8.12 /entryContract:Reentrancy /target:Ultimate /ltlSpecFile:simple.spec
```
That should generate a Boogie file `simple_astReentrancy.bpl`
You can also specify the attack model:
```
VeriSol simple_ast.json /solc:0.8.12 /entryContract:Reentrancy /target:Ultimate /ltlSpecFile:simple.spec /stubModel:callback
```
That produces a slightly different Boogie model that has an additional function for modelling fallbacks.

3. You can try to feed the resulting Boogie file into Ultimate.
Even that example makes Ultimate's termination analysis fail during a phase called MapElimination.

```
Ultimate -tc LTLAutomizer.xml -s LTLAutomizerWithDebugOutput.epf -i simple_astReentrancy.bpl
```
