defmodule Ring do
    
   def aux(n,[],msg,m) do
        pid= spawn(Ring, :loop,[])
        aux(n-1,[pid],msg,m)
    end

    def aux(0,list=[hd|tl],msg,m) do
        send hd, {msg,tl,list,m-1}
        
    end

    def aux(0,list,msg,m) do
        send list, {msg,list,list,m-1}
        
    end


    def aux(n,list,msg,m) do
        pid= spawn(Ring, :loop,[])
        aux(n-1,[pid|list],msg,m)
    end

    def loop() do
        receive do
        {_,_,list,0} -> kill(list)
        {msg,[hd|tl],list,n} -> send hd, {msg,tl,list,n-1}
                                loop()
        {msg,[],[hd|tl],n}-> send hd, {msg,tl,[hd|tl],n-1}
                                        loop()
        {msg,l,list,n} -> send l, {msg,list,list,n-1}
                                    loop()
        
     end
        
end
    def kill([hd|tl]), do: (Process.exit(hd, :kill); kill(tl)) 
    def kill([]), do: :ok

    def start(n,m,msg), do: (:ok; aux(n,[],msg,m))

    

end