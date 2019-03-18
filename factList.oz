declare
fun{FactList N}

    fun {Fact N}
        fun {FactIter N A}
            if N==0 then A
                elseif N>0 then {FactIter N-1 A*N}
                else raise errorDeDominio end
            end
        end
        in
        {FactIter N 1}
    end

    fun{ListaIter N}
        if N==0 then
            nil
        else
            {Fact N}|{ListaIter N-1}
        end
    end

    in
    {ListaIter N}
end

{Browse {FactList 5}}