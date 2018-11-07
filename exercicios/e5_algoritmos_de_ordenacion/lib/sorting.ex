

defmodule Sorting do

     def reverse(list) do
    do_reverse(list, [])
  end

  defp do_reverse([], reversed) do
    reversed
  end

  defp do_reverse([h|t], reversed) do
    do_reverse(t, [h|reversed])
  end


    defp aux([],_,list), do: reverse(list)
    defp aux([head|tail],num,list2) when head<=num, do: aux(tail,num,[head|list2])
    defp aux([head|tail],num,list2) when head>num, do: aux(tail,num,list2)
    

    def filter(list,num), do: aux(list,num,[])

    defp auxc([[head|tail2]|tail],list2) , do: auxc([tail2|tail],[head|list2])
    defp auxc([[]|tail],list2) , do: auxc(tail,list2)
    defp auxc([],list2), do: list2

    def concatenate(list), do: reverse(auxc(list,[]))
    
    defp auxf([[head|tail2]|tail],list2) , do: auxf([head|[tail2|tail]],list2)
    defp auxf([[]|tail],list2) , do: auxf(tail,list2)
    defp auxf([head|tail],list2) , do: auxf(tail,[head|list2])
    defp auxf([],list2), do: list2

    def flatten(list), do: reverse(auxf(list,[]))

    

   def quicksort([]), do: []

   def quicksort([h|tl]) do
        menores= for i<-tl, i<=h, do: i
        mayores= for i<-tl, i>h, do: i
        quicksort(menores) ++ [h|quicksort(mayores)]
    end


    defp auxm(list,[],[]), do: auxm(list,Enum.split(list,4),[])
    defp auxm(list,[[hd|tl]|tl2],[]), do: auxm(list,[Enum.split([hd|tl],2)|tl2],[])
    defp auxm(list,[hd|tl],[]), do: auxm(list,tl,hd)
    defp auxm(list,[hd|tl],list2), do: auxm(list,tl,sorting(list2,hd,[]))
    defp auxm(list,[],list2), do: list2

    def mergesort(list), do: auxm(list,[],[])

end