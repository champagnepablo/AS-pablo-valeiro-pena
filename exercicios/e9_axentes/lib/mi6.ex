defmodule Mi6 do
  require GenServer
  require Create
  require Db
  require Manipulating
  require Agent

  def fundar() do
    {_,_} = GenServer.start_link(Mi6, Db.new(),name: :mi6)
    :ok
  end

  def init(staxx) do
    {:ok, staxx}
  end

  def recrutar(axente, destino) do
      GenServer.cast(:mi6,{:recrutar, {axente,destino}})
      :ok
  end

  def asignar_mision(axente, mision) do
      GenServer.cast(:mi6,{:asignar, {axente, mision}})
      :ok
  end

  def mision([h | t], :espiar) do
      Manipulating.filter([h | t], h)
  end

  def mision(l, :contrainformar) do
      Manipulating.reverse(l)
  end

  def handle_cast({:recrutar, {axente, destino}}, staxx) do
      lectura = Db.read(staxx, axente)
      case lectura do
        {:ok, _} ->
          {:noreply, staxx}
        {:error, :not_found} ->
          length = String.length(destino)
          l = Enum.shuffle(Create.create(length))
          {:ok, pid} = Agent.start_link(fn () -> l end)
          {:noreply, Db.write(staxx, axente, pid)}
      end
  end
  
  def handle_cast({:asignar, {axente, mision}}, staxx) do
      agent = Db.read(staxx, axente)
      case agent do
          {:error, :not_found} ->
              {:noreply, staxx}
          {:ok, pid}->
              Agent.cast(pid, Mi6, :mision, [mision])
              {:noreply, staxx}
      end
  end

  def consultar_estado(axente) do
      GenServer.call(:mi6,{:consultar, axente})
  end

  def handle_call({:consultar, axente}, _from, staxx) do
      agent = Db.read(staxx, axente)
      case agent do
          {:error, :not_found} ->
              {:reply, :you_are_here_we_are_not, staxx}
          {:ok, pid}->
              result = Agent.get(pid, fn staxx -> staxx end)
              {:reply, result, staxx}
      end
  end

  def disolver() do
      GenServer.stop(:mi6, :normal)
      :ok
  end

end
