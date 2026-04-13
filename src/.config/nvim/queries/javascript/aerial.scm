; extends

; add_task / add_setup with a named function — show the function name
; e.g. add_task(async function test_prefChangeUpdatesVisibility() { ... })
(call_expression
  function: (identifier) @_call
  (#any-of? @_call "add_task" "add_setup")
  arguments: (arguments
    (function_expression
      name: (identifier) @name))
  (#set! "kind" "Function")) @symbol

; add_task / add_setup with an anonymous function — show the call name
; e.g. add_setup(async function () { ... })
(call_expression
  function: (identifier) @name
  (#any-of? @name "add_task" "add_setup")
  arguments: (arguments
    (function_expression
      !name))
  (#set! "kind" "Function")) @symbol

; add_task / add_setup with an arrow function
; e.g. add_task(async () => { ... })
(call_expression
  function: (identifier) @name
  (#any-of? @name "add_task" "add_setup")
  arguments: (arguments
    (arrow_function))
  (#set! "kind" "Function")) @symbol
