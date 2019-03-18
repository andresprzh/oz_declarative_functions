declare
fun {Min L}
    fun {MinLoop L M}
        case L of 
        nil then 
            M
        [] H|T then
            if M < H then {MinLoop T M}
            else {MinLoop T H} end
        end
    end

    in
    if L == nil then 
        error
    else 
        {MinLoop L.2 L.1} 
    end
end

declare 
L=[2 4 5 7 1 0 2 6 7 8 6 ]
L=[2 4 ]

{Browse {Min L}}


% case L.2.2 of nil then 
%     {Browse 1}
% else
%     {Browse 0}
% end
declare
fun{Function X}
    if X<0 then
       negativo
    end
end

{Browse {Function 5}}


declare
proc{Function X Y}
    Y=if X<0 then
       negativo
    end
end
{Browse {Function 5}}

declare
proc{Function X Y}
    if X<0 then
       negativo
    end
end
{Browse {Function 5}}