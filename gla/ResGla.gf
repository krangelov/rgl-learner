resource ResGla = {

param Case = Gen | Dat | Nom ;
param Species = Indef | Def ;
param Number = Pl | Sg ;
param Gender = Masc ;
oper N = {s: Case => Species => Number => Str; voc: Number => Str; g: Gender} ; -- 5692
oper mkN : (_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Gender -> N =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,g ->
          { s = table {
                  Nom => table {
                           Indef => table {
                                      Sg => f1 ;
                                      Pl => f2
                                    } ;
                           Def => table {
                                    Sg => f3 ;
                                    Pl => f4
                                  }
                         } ;
                  Dat => table {
                           Indef => table {
                                      Sg => f5 ;
                                      Pl => f6
                                    } ;
                           Def => table {
                                    Sg => f7 ;
                                    Pl => f8
                                  }
                         } ;
                  Gen => table {
                           Indef => table {
                                      Sg => f9 ;
                                      Pl => f10
                                    } ;
                           Def => table {
                                    Sg => f11 ;
                                    Pl => f12
                                  }
                         }
                } ;
            voc = table {
                    Sg => f13 ;
                    Pl => f14
                  } ;
            g = g
          } ;



}
