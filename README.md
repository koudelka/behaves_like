# BehavesLike
[![Build Status](https://travis-ci.org/koudelka/behaves_like.svg?branch=master)](https://travis-ci.org/koudelka/behaves_like)
[![Hex pm](https://img.shields.io/hexpm/v/behaves_like.svg?style=flat)](https://hex.pm/packages/behaves_like)

Turns a module's specs into callbacks.

Lets you state that a module behaves like another, without writing behaviour callbacks.

For example:
```elixir
defmodule API do
  use BehavesLike

  @spec get(binary()) :: {:ok, any()} | {:error, any()}
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
    {:behaves_like, "~> 0.2.0"}
  ]
end
```

## Usage

Just add `use BehavesLike` to your module, then you can use the standard `@behaviour` attribute in other modules to refer to it.
