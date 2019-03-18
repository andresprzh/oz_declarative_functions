% FUNCION CREAR LISTA
declare
fun {Linea I Max}
   fun{Iterar I A Max}
      if Max==0 then nil
      else
         I#A|{Iterar I A+1 Max-1}
      end
   end
   in
   {Iterar I 1 Max} 
end

{Browse {Linea 1 10}}

% FUNCION INVERTIR LISTA
declare
fun{Invertir Ls}
   {Map Ls fun{$ X}
      case X of nil then nil 
      [] A#B then 
         B#A
      end
   end}
end
{Browse {Invertir {Linea 1 10}}}

% FUNCION CONSTRUIR
declare
fun {ConstruirMult Xs Ys}
   fun{Construir Xs Ys} '*'(Xs Ys) end
   in
   {List.zip Xs Ys Construir}
end

{Browse {ConstruirMult {Linea 1 10} {Linea 2 10}}}

declare
fun {MultiplicarFilas Es L1 L2}
   {FoldR Es.2 fun{$ X Y} f(X Y) end Es.1}
end

