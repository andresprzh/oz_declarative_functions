% DERIVAR FUNCION
declare
fun {Derivar F A}
   fun {Dconstante F A}
      if F==A then
         1.0
      else
         0.0 
      end
   end

   in
   if F==nil then nil
   elseif {Number.is F} then 0.0
   elseif {Atom.is F} then {Dconstante F A}
   else
      case {Label F} of s then s({Derivar F.1 A} {Derivar F.2 A})
      [] r then r({Derivar F.1 A} {Derivar F.2 A})
      [] m then s( m({Derivar F.1 A} F.2) m(F.1 {Derivar F.2 A}) )
      [] d then d( r( m({Derivar F.1 A} F.2) m(F.1 {Derivar F.1 A}) ) e(F.2 2))
      [] l then d( {Derivar F.1 A} F.1)
      [] e then m( e(F.1 F.2) s( d( m({Derivar F.1 A} F.2) F.1) m({Derivar F.2 A} l(F.1))) )
      end
   end
end
{Browse {Derivar s(k m(3.0 x)) x}}
{Browse {Derivar s(x 1) x}}

% EVALUAR FUNCION
declare 
fun {Evaluar F A V}
   fun {Constante F A V}
      if F==A then
         V
      else
         error 
      end
   end

   in
   if F==nil then 0.0
   elseif {Number.is F} then F
   elseif {Atom.is F} then {Constante F A V}
   else
      case {Label F} of s then {Evaluar F.1 A V}+{Evaluar F.2 A V}
      [] r then {Evaluar F.1 A V}-{Evaluar F.2 A V}
      [] m then {Evaluar F.1 A V}*{Evaluar F.2 A V}
      [] d then {Evaluar F.1 A V}/{Evaluar F.2 A V}
      [] l then {Float.log {Evaluar F.1 A V}}
      [] e then {Number.pow {Evaluar F.1 A V} {Evaluar F.2 A V} }
      end
   end
end
{Browse {Evaluar d(2.0 x) x 4.0}}


% LIMPIAR CEROS FUNCION
declare 
fun{Limpiar F}

   fun{Lsuma F}
      if {Limp F.1}==0.0 then {Limp F.2}
      elseif {Limp F.2}==0.0 then {Limp F.1}
      else s({Limp F.1} {Limp F.2}) end
   end

   fun{Lresta F}
      if {Limp F.2}==0.0 then {Limp F.1}
      elseif {Limp F.1}==0.0 then r(0.0 {Limp F.2})
      else r({Limp F.1} {Limp F.2}) end
   end

   fun{Lmult F}
      if {Limp F.1}==0.0 then 0.0
      elseif {Limp F.2}==0.0 then 0.0
      elseif {Limp F.1}==1.0 then {Limp F.2}
      elseif {Limp F.2}==1.0 then {Limp F.1}
      else m({Limp F.1} {Limp F.2}) end
   end

   fun{Ldiv F}
      if {Limp F.1}==0.0 then 0.0
      elseif {Limp F.2}==0.0 then error
      elseif {Limp F.2}==1.0 then {Limp F.1}
      else d({Limp F.1} {Limp F.2}) end
   end

   fun{Lexp F}
      if {Limp F.1}==0.0 then 0.0
      elseif {Limp F.2}==0.0 then 1.0
      elseif {Limp F.2}==1.0 then {Limp F.1}
      else e({Limp F.1} {Limp F.2}) end
   end

   fun{Limp F}
      if F==nil then 0.0
      elseif {Number.is F} then F
      elseif {Atom.is F} then F
      else
         case {Label F} of s then {Lsuma F}
         [] r then {Lresta F}
         [] m then {Lmult F}
         [] d then {Ldiv F}
         [] l then l({Limp F.1})
         [] e then {Lexp F}
         end
      end
   end

   in
   {Limp F}
   
end

{Browse {Limpiar s(0.0 3.0)}}
{Browse {Limpiar s(0.0 s(m(0.0 x) m(3.0 1.0)))}}
{Browse {Limpiar  e(x 0.0)}}

% FUNCION RAIZ  DE UNA FUNCION
declare
fun{BuenaAprox F1 A V}
   fun{Abs X}
      if X<0.0 then
         ~X
      else
         X
      end
   end
   in
   {Abs {Evaluar F1 A V}}<0.00000001
end

declare
fun{Raiz F A X0 BuenaAprox}
   
   fun {Iterar F F1 X0 BuenaAprox}
      if {BuenaAprox F A X0} then X0
      else X1 in 
	 X1=X0-({Evaluar F A X0}/{Evaluar F1 A X0})
         {Iterar F F1 X1 BuenaAprox}
      end
   end
   in
   {Iterar F {Derivar F A} X0 BuenaAprox}
end

declare F 
F=r(e(x x) 100.0)
{Browse F}
{Browse {Raiz F x 1.0 BuenaAprox}}
