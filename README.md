## This component is a lexical analyzer built with flex, designed to parse source code written in the simplified AC language. It extracts lexical tokens that are useful for further syntactic analysis or for higher-level tasks such as text similarity comparison between AC programs.

### Requirements

Ensure you have the following installed on your system:

- `flex`
- `bison`
- `gcc`
- `autoconf` & `automake`
- (Optional) `python3` to generate test AC files

---

## Files Included

| File                | Description                                  |
|---------------------|----------------------------------------------|
| `lex_analaizer.l`   | The lexer definition in Flex                 |
| `Makefile`          | Compilation script using Flex + GCC          |
| `code_generator.py` | Python script to generate random AC code     |
| `example.ac`        | Sample input code in AC                      |

---

## How to Use

1. **Generate AC Code (optional)**  
   Run this command to create a random test file:

   ```bash
   python3 code_generator.py > example.ac
   ```

2. **Build the Lexer**

   Inside the project folder, run:

   ```bash
   make
   ```

   This will:
   - Run `flex` on `lex_analaizer.l`
   - Compile the result with `gcc`
   - Produce an executable called `lex_analaizer`

3. **Run the Lexer**

   ```bash
   ./lex_analaizer example.ac
   ```

   You will see output like:

   ```
   COMMENT
   floatdcl id
   intdcl id
   id assign inum
   id assign id op inum
   print id
   ```

---

## Example AC Code

```ac
// simple comment
f b
i a
a = 5
b = a + 3
p b
```

Lexer output:

```
COMMENT
floatdcl id
intdcl id
id assign inum
id assign id op inum
print id
```
