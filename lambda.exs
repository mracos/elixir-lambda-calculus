# decode church
decode_numeral = fn f -> f.(fn x -> x + 1 end).(0) end
decode_boolean = fn f -> f.(true).(false) end

# numbers
zero  = fn f -> fn x -> x end end
one   = fn f -> fn x -> f.(x) end end
two   = fn f -> fn x -> f.(f.(x)) end end
three = fn f -> fn x -> f.(f.(f.(x))) end end
four  = fn f -> fn x -> f.(f.(f.(f.(x)))) end end
five  = fn f -> fn x -> f.(f.(f.(f.(f.(x))))) end end
six   = fn f -> fn x -> f.(f.(f.(f.(f.(f.(x)))))) end end
seven = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(x))))))) end end
eight = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(f.(x)))))))) end end
nine  = fn f -> fn x -> f.(f.(f.(f.(f.(f.(f.(f.(f.(x))))))))) end end

# booleans
true_ = fn a -> fn b -> a end end
false_ = fn a -> fn b -> b end end
