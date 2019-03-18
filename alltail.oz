declare
proc {ForAllTail Xs P}
    
    case Xs of H|T then  
        if T==nil then
            % skip
            {P H|nil}
        else
            {P Xs}
            {ForAllTail T P}
        end
    end
   
end

declare L
L=[2 4 5 7 1 0 2 6 7 8 6 ]
{ForAllTail L Browse}
{ForAllTail [1 2 3 4 5]
 proc{$ X} {Browse X#{List.length X}} end
}