defmodule Measure do
require Manipulating
require Sorting

 def aux([{var1,var2}|tl],n,list1,list2)  do
 l=[(for n<- 1..n, do: :rand.uniform(1000))]
  aux(tl,n,[Task.async(var1 ,var2 ,[l])|list1],[l|list2])
end

 def aux([],n,list1,list2)  do
  {list1,list2}
end


 def esperar(tareas) do for i<- tareas, do: Task.await(i) end

 def enlazar(lista1,lista2), do: Enum.zip(lista1,lista2)

def aux([{{var1,var2},var3}|tl],[]) , do: aux(tl,[Task.async(var1,var2,var3)])
def aux([{{var1,var2},var3}|tl],lista) , do: aux(tl,[Task.async(var1,var2,var3)|lista])

def aux([],lista) , do: lista

def tiempos([hd|tl],list) do
     time1= :erlang.timestamp
     Task.await(hd,10000)
     time2=  :erlang.timestamp 
     time2= :timer.now_diff(time2,time1)
     tiempos(tl,[time2|list])

end


def tiempos([],list) do
 list

end

def run(list,n) do
    {l1,l2}= aux(list,n,[],[])
    esperar(l1)
    lista2=enlazar(list,l2)
    lista3=aux(lista2,[])
    IO.puts(tiempos(lista3,[]))


end



end