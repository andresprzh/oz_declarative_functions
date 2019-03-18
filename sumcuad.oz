declare
fun {SumCuad N}
    fun{Iterar S D EsFinal Transformar}
        if {EsFinal S} then D
        else S1 D1 in
            S1=S+1
            D1={Transformar S1  D}
            {Iterar S1 D1 EsFinal Transformar}
        end
    end
    in
    {Iterar 0 0
        fun {$ I} I==N end
        fun {$ I R} (I)*(I)+R end
    }
 
end
{Browse {SumCuad 5}}

% declare
% fun {SumCuad N}
%     fun{Iterar S EsFinal Transformar}
%         if {EsFinal S} then S
%         else S1 in
%             S1={Transformar S}
%             {Iterar S1 EsFinal Transformar}
%         end
%     end
%     in
%     {Iterar t(0 0)
%         fun {$ t(I _)} I==N end
%         fun {$ t(I R)} t(I+1 (I+1)*(I+1)+R)end
%     }.2
% end
% {Browse {SumCuad 5}}

% declare
% fun {SumCuad N}
%     if N == 0 then 0
%     else N*N + {SumCuad N-1}
%     end
% end

% declare
% proc {SumCuad N R}
%     if N == 0 then 
%         R=0
%     else  N1 R1 in 
%         N1=N-1
%         {SumCuad N1 R1}
%         R=N*N+R1
%     end
% end



