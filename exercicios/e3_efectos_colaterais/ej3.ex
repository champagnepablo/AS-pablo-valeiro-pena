
defmodule Macroej3 do
defguard es_par_valido(n,m) when n<m and rem(n,2)==0
end

defmodule Effects do 

import Macroej3, only: [es_par_valido: 2 ] 
defp aux(n,m) when n<m, do: (IO.puts (n); aux(n+1,m))
defp aux(n,m) when n==m, do: IO.puts (n)

def print(n) do aux(1,n)
end
 

defp aux2(n,m) when es_par_valido(n,m), do: (IO.puts(n);aux2(n+1,m))
defp aux2(n,m) when n==m, do: IO.puts(n)
defp aux2(n,m), do: aux2(n+1,m)

def even_print(n) do aux2(1,n)

end


end


