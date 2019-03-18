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
proc {Min L R}
    
    proc {MinLoop L M Res}
        Res=case L of 
        nil then 
            M
        [] H|T then
            if M < H then {MinLoop T M}
            else {MinLoop T H} end
        end
    end
    

    in
    
    if L == nil then 
       R= error
    else 
        {MinLoop L.2 L.1 R} 
    end
end

declare R
L=[2 4 5 7 1 0 2 6 7 8 6 ]
%L=[2 4 ]

{Browse {Min L}}