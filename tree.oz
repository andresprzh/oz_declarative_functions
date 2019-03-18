% declare
% fun {GetElementsInOrder Tree}
%    local GetList  in
%       fun {GetList T L}
% 	 local A B C  in
% 	 if T == nil then L
% 	 else
% 	    A = {GetList T.left L}	    
% 	    B = {GetList T.right L}
% 	   C=[ T.info]
%            { Append {Append {Append L A} C} B} 
%           %	   {Append A B }
% 	 end
% 	 end
%       end
%       {GetList Tree nil}
%    end
% end


declare
fun {GetElementsInOrder Tree}
   fun {GetList T}
      local I L R in
         case T of nil then nil
         [] tree(info:I left:L right:R) then
            I|{Append {GetTree L} {GetTree R}}
         end
      end
   end
   in
   {Sort {GetList Tree} Value.'<'}
end

declare Tree
Tree = tree(info:10
            left:tree(info:7
                      left:nil
                      right:tree(info:9
                                left:nil
                                right:nil))
            right:tree(info:18
                       left:tree(info:14
                                left:nil
                                right:nil)
		       right:nil))
 {Browse {GetTree Tree}}
{Browse {GetElementsInOrder Tree}}
