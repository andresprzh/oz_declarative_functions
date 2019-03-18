declare
fun {Aplanar Xs}
    case Xs 
        of nil then 
            nil
        [] X|Xr andthen {IsList X} then
            {Append {Aplanar X} {Aplanar Xr}}
        [] X|Xr then
            X|{Aplanar Xr}
    end
end
{Browse {Flatten [a [b [c d]] e [[[f]]]]}}