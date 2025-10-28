resource ResGla = {

param Case = Nom | Dat | Gen ;
param Species = Indef | Def ;
param Number = Sg | Pl ;
param Gender = Masc | Fem ;
oper Noun = {s: Case => Species => Number => Str; voc: Number => Str; g: Gender} ; -- 5067
oper mkNoun : (_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Gender -> Noun =
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

param Person = P1 | P2 | P3 ;
param VForm = Indep | Dep ;
oper Verb = {s: Str; conditional: Number => Str; imperative: Person => Number => Str; future, past : VForm => Str; noun, participle: Str} ; -- 729
oper mkVerb : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> Verb =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15 ->
          { s = f1 ;
            conditional = table {
                            Sg => f2 ;
                            Pl => f3
                          } ;
            imperative = table {
                           P1 => table {
                                   Sg => f4 ;
                                   Pl => f5
                                 } ;
                           P2 => table {
                                   Sg => f6 ;
                                   Pl => f7
                                 } ;
                           P3 => table {
                                   Sg => f8 ;
                                   Pl => f9
                                 }
                         } ;
            future = table {
                       Indep => f10 ;
                       Dep   => f11
                     } ;
            past   = table {
                       Indep => f12 ;
                       Dep   => f13
                     } ;
            noun = f14 ;
            participle = f15
          } ;


oper Compl = {s : Number => Person => Str; c : Case} ; -- 40
oper mkPrep : (_,_,_,_,_,_ : Str) -> Compl =
       \f1,f2,f3,f4,f5,f6 ->
          { s = table {
                  Sg => table {
                          P1 => f1 ;
                          P2 => f2 ;
                          P3 => f3
                        } ;
                  Pl => table {
                          P1 => f4 ;
                          P2 => f5 ;
                          P3 => f6
                        }
                } ;
            c = Dat
          } ;
oper noPrep : Compl = {s=\\_,_=>""; c=Dat} ;


param AForm = ASg Case Gender | APl ;
oper Adj = {s: AForm => Str; voc: Gender => Str; compar: Str} ; -- 686
oper mkAdj : (_,_,_,_,_,_,_,_,_,_ : Str) -> Adj =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10 ->
          { s = table {
                  ASg Nom Masc => f1 ;
                  ASg Nom Fem => f2 ;
                  ASg Dat Masc => f3 ;
                  ASg Dat Fem => f4 ;
                  ASg Gen Masc => f5 ;
                  ASg Gen Fem => f6 ;
                  APl => f7
                } ;
            voc = table {
                    Masc => f8 ;
                    Fem => f9
                  } ;
            compar = f10 ;
          } ;

}
