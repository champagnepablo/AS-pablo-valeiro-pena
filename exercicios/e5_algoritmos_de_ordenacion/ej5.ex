defmodule Sorting do
    import Manipulating, only: [reverse: 1 , flatten: 1, concatenate: 1]
    #funcion privada auxiliar encargada de dividir la lista en dos
    defp aux([hd|tl],piv,[],list) when hd<= piv, do: aux(tl,piv,[hd],list)
    defp aux([hd|tl],piv,list,[]) when hd> piv, do: aux(tl,piv,list,[hd])
    defp aux([hd|tl],piv,list1,list2) when hd<= piv, do: aux(tl,piv,sorting(hd,list1,[]),list2)
    defp aux([hd|tl],piv,list1,list2) when hd> piv, do: aux(tl,piv,list1,sorting(hd,list2,[]))
    defp aux([],piv,list1,list2), do: flatten([list1,piv,list2])


    #funcion privada que realiza una insercion ordenada en cada una de las dos sublistas
    defp sorting(num,[hd|tl],[]) when num<=hd, do: sorting(false,tl,[num])
    defp sorting(num,[hd|tl],[]) when num>hd, do: sorting(num,tl,[hd])
    defp sorting(num,[hd|tl],list) when num<=hd, do: sorting(false,tl,[num|list])
    defp sorting(num,[hd|tl],list) when num>hd, do: sorting(num,tl,[hd|list])
    defp sorting(false,[],list), do: reverse(list)
    defp sorting(num,[],list), do: reverse([num|list])


    def quicksort([hd|tl]), do: aux(tl,hd,[],[])


    defp auxm(list,[],[]), do: auxm(list,Enum.split(list,4),[])
    defp auxm(list,[[hd|tl]|tl2],[]), do: auxm(list,[Enum.split([hd|tl],2)|tl2],[])
    defp auxm(list,[hd|tl],[]), do: auxm(list,tl,hd)
    defp auxm(list,[hd|tl],list2), do: auxm(list,tl,sorting(list2,hd,[]))
    defp auxm(list,[],list2), do: list2

    def mergesort(list), do: auxm(list,[],[])
end