-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
  name = "Python",
  files = { "%.py$", "%.pyw$" },
  headers = "^#!.*[ /]python",
  comment = "#",

   patterns = {
    -- Strings
    -- f prefix as keyword
    { pattern = "f(?=[\"'])", type = "keyword" },

    -- f-strings (triple quotes)
    { pattern = { 'f"""', '"""', '\\' }, type = "string" },
    { pattern = { "f'''", "'''", '\\' }, type = "string" },

    -- f-strings (single/double quotes)
    { pattern = { 'f"', '"', '\\' }, type = "string" },
    { pattern = { "f'", "'", '\\' }, type = "string" },
    
    { pattern = { '"""', '"""', '\\' }, type = "string" },
    { pattern = { "'''", "'''", '\\' }, type = "string" },
    { pattern = { '"', '"', '\\' },     type = "string" },
    { pattern = { "'", "'", '\\' },     type = "string" },
    -- Numbers
    { pattern = "-?0x[%da-fA-F]+",      type = "number" },
    { pattern = "-?%d+[%d%.eE]*",       type = "number" },

    -- Comments
    { pattern = "#.*\n",                type = "comment" },

    -- Operators
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },

    -- --- IDENTIFIERS ---
    -- ALL_CAPS standalone or after a dot
    { pattern = "%.?%u[%u%d_]*%f[^%w_]", type = "operator" },

    -- Class names (PascalCase)
    { pattern = "%u[%w_]*",             type = "class" },
    
    -- Class names after a dot (e.g. .MyClass)
    { pattern = "%.%u[%w_]*",           type = "class" },

    -- Import
    { pattern = "from %.?[%a_][%w_]* import  %.?%,?[%a_][%w_]* ", type = "class" },
    { pattern = "import %.?[%a_][%w_]* as %.?%,?[%a_][%w_]* ", type = "class" },
    { pattern = "import %.?[%a_][%w_]*", type = "class" },
    -- Function calls
    { pattern = "[%a_][%w_]*%f[(]",     type = "function" },

    -- Attributes with parentheses (ex: .lower())
    { pattern = "%.[%a_][%w_]*%f[(]",   type = "function" },

    -- Attributes without parentheses (ex: .lower)
    { pattern = "%.[%a_][%w_]*",        type = "field" },


    -- Catch-all identifiers
    { pattern = "[%a_][%w_]*",          type = "field" },
  },

  symbols = {
    -- PACKAGE
    ["ft"] = "class",

    -- Keywords
    ["def"] = "keyword",
    ["class"] = "keyword",
    ["if"] = "keyword",
    ["elif"] = "keyword",
    ["else"] = "keyword",
    ["while"] = "keyword",
    ["for"] = "keyword",
    ["in"] = "keyword",
    ["try"] = "keyword",
    ["except"] = "keyword",
    ["finally"] = "keyword",
    ["with"] = "keyword",
    ["as"] = "keyword",
    ["return"] = "keyword",
    ["import"] = "keyword",
    ["from"] = "keyword",
    ["pass"] = "keyword",
    ["break"] = "keyword",
    ["continue"] = "keyword",
    ["lambda"] = "keyword",
    ["yield"] = "keyword",
    ["global"] = "keyword",
    ["nonlocal"] = "keyword",
    ["assert"] = "keyword",
    ["del"] = "keyword",
    ["raise"] = "keyword",
    ["async"] = "keyword",
    ["await"] = "keyword",
    ["not"] = "keyword",
    ["or"] = "keyword",
    ["and"] = "keyword",
    ["is"] = "keyword",

    -- Literals
    ["True"] = "literal",
    ["False"] = "literal",
    ["None"] = "literal",

    -- Builtins
    ["self"] = "class",
    ["print"] = "function",
    ["len"] = "function",
    ["range"] = "function",
    ["list"] = "function",
    ["dict"] = "function",
    ["set"] = "function",
    ["tuple"] = "function",
    ["isinstance"] = "function",
    ["super"] = "function",
    ["object"] = "type"
  }
}
