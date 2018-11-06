# Used by "mix format"
[
  inputs: ["mix.exs", "{config,lib,test}/**/*.{ex,exs}"],
  export: [
    locals_without_parens: [spec_and_callback: 1]
  ]
]
