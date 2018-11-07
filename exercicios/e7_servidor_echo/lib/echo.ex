defmodule Echo do
 
 def start(), do: (Process.register(spawn(Echo,:loop,[]),:echo) ; :ok)

def loop() do
    receive do 
        {:print,msg} -> (IO.puts(msg); loop()) 
        { :stop} -> :ok
    end
    end
def print(term) do
    send :echo, {:print,term} 
    :ok
end

def stop() do
    send :echo, { :stop}
     Process.unregister(:echo)
      :ok
end
end