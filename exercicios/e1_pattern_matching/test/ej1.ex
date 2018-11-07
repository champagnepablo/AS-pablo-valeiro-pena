defmodule Boolean do

def b_not(:true), do: false
def b_not(:false), do: true


def b_and(:true,:true), do: true
def b_and(val1,val2), do: false


def b_or(:false,:false), do: false
def b_or(val1,val2),  do: true
end
end
