# BehavesLike

[![Build Status](https://travis-ci.org/koudelka/behaves_like.svg?branch=master)](https://travis-ci.org/koudelka/behaves_like)
[![Hex pm](https://img.shields.io/hexpm/v/behaves_like.svg?style=flat)](https://hex.pm/packages/behaves_like)

Turns a module's specs into callbacks.

Lets you state that a module behaves like another, without writing behaviour callbacks.

Uses a macro for 1.7, until https://github.com/elixir-lang/elixir/issues/8085 is fixed.

For example:
```elixir
defmodule API do
  use BehavesLike
  import BehavesLike, only: [spec_and_callback: 1]

  spec_and_callback get(binary()) :: {:ok, any()} | {:error, any()}
  def get(id) do
    Backend.get(id)
  end
end

defmodule Backend do
  @behaviour API

  @impl true
  def get(id) do
    database().get(id)
  end
end
```

## Installation

From Hex:

```elixir
def deps do
  [
    {:behaves_like, "~> 0.5.0"}
  ]
end
```

## Usage

Import the required macro, then declare your specs with `spec_and_callback/1`, as in the example above.
