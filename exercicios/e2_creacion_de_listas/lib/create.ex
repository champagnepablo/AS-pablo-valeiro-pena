defmodule Create do

def create(n), do:  aux([],n)

defp aux(list,0), do: list
defp aux([],n),do:
  aux([n],n-1)

defp aux(list,n),do:
    aux([n]++list,n-1)




def reverse_create(n), do:  reverse_aux([],n)

defp reverse_aux(list,0), do: list
defp reverse_aux([],n),do:
  reverse_aux([n],n-1)

defp reverse_aux(list,n),do:
    reverse_aux(list++[n],n-1)



end
