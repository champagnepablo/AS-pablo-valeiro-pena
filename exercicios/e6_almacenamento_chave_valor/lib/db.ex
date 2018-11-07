defmodule Db do
    defstruct [:key,:value]

    def new(), do: []

    def write([],ke,valu) , do: [%Db{key: ke,value: valu}]
    def write(list,ke,valu), do: [%Db{key: ke, value: valu}|list]

    defp auxd([%Db{key: ke, value: _}|tl],key_b,[]) when ke==key_b, do: tl
    defp auxd([hd=%Db{key: ke, value: _}|tl],key_b,[]) when ke !==key_b, do: auxd(tl,key_b,hd)    
    defp auxd([hd=%Db{key: ke, value: _}|tl],key_b,list) when ke !==key_b, do: auxd(tl,key_b,[hd|list])
    defp auxd([%Db{key: ke, value: _}|tl],key_b,list) when ke==key_b, do: auxd(tl,true,list)
    defp auxd([hd=%Db{key: _, value: _}|tl],key_b,list) when key_b==true, do: auxd(tl,key_b,[hd|list])
    defp auxd([],_,list), do: list
  
    def delete(db_ref,key), do: auxd(db_ref,key,[])

    def read([%Db{key: ke, value: value}|_],key_r) when ke==key_r, do: {:ok, value}
    def read([%Db{key: ke, value: _}|tl],key_r) when ke !==key_r, do: read(tl,key_r)
    def read(%Db{key: ke, value: _},key_r) when ke !==key_r, do: {:error, :not_found}
    def read(%Db{key: ke, value: _},key_r) when ke ==key_r, do: {:ok, :value}

    def read([],_) , do: {:error, :not_found}



    def auxm([%Db{key: ke, value: value}|tl],valor,[]) when value==valor, do: auxm(tl,valor,[ke])
    def auxm([%Db{key: _, value: value}|tl],valor,[]) when value !==valor, do: auxm(tl,valor,[])
    def auxm([%Db{key: ke, value: value}|tl],valor,list) when value==valor, do: auxm(tl,valor,[ke|list])
    def auxm([%Db{key: _, value: value}|tl],valor,list) when value !=valor, do: auxm(tl,valor,list)
    def auxm(%Db{key: _, value: value},valor,list) when value !=valor, do: []
    def auxm(%Db{key: _, value: value},valor,list) when value ==valor, do: [value]


    def auxm([],_,list) , do: list

    def match(list,valor), do: auxm(list,valor,[])

     
    def destroy(list), do: (list=[]; :ok )


  end

