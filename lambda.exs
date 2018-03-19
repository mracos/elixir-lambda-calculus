# decode church
decode_numeral = fn f -> f.(fn x -> x + 1 end).(0) end
decode_boolean = fn f -> f.(true).(false) end

# numbers
zero = fn f -> fn x -> x end end
one = fn f -> fn x -> f.(x) end end
two = fn f -> fn x -> f.(f.(x)) end end
three = fn f -> fn x -> f.(f.(f.(x))) end end
four = fn f -> fn x -> f.(f.(f.(f.(x)))) end end
five = fn f -> fn x -> f.(f.(f.(f.(f.(x))))) end end
six = fn f -> fn x -> f.(f.(f.(f.(f.(f.(x)))))) end end
seven = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(x))))))) end end
eight = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(f.(x)))))))) end end
nine = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(f.(f.(x))))))))) end end

# booleans
true_ = fn a -> fn b -> a end end
false_ = fn a -> fn b -> b end end

# operators
succ = fn n -> fn f -> fn x -> f.(n.(f).(x)) end end end

pred = fn n ->
  fn f ->
    fn x ->
      n.(fn g -> fn h -> h.(g.(f)) end end).(fn u -> x end).(fn u -> u end)
    end
  end
end

plus = fn m -> fn n -> m.(succ.(n)) end end
sub = fn m -> fn n -> n.(pred.(m)) end end
mult = fn m -> fn n -> fn f -> m.(n.(f)) end end end
pow = fn b -> fn e -> e.(b) end end

# boolean operators
and_ = fn p -> fn q -> p.(q).(p) end end
or_ = fn p -> fn q -> p.(p).(q) end end
not_ = fn p -> p.(false_).(true_) end

# examples of numerals
IO.puts decode_numeral.(zero)
IO.puts decode_numeral.(succ.(one))
IO.puts decode_numeral.(pred.(two))
IO.puts decode_numeral.(plus.(three).(four))
IO.puts decode_numeral.(sub.(six).(five))
IO.puts decode_numeral.(mult.(seven).(eight))
IO.puts decode_numeral.(pow.(two).(nine))

# examples of booleans
IO.puts decode_boolean.(true_)
IO.puts decode_boolean.(and_.(true_).(false_))
IO.puts decode_boolean.(or_.(true_).(false_))
IO.puts decode_boolean.(not_.(true_))
