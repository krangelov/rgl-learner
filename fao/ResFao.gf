resource ResFao = {

param Number = Sg | Pl ;
param Case = Nom | Gen | Dat | Acc ;
oper N = {Def: Number => Case => Str; Indef: Number => Case => Str; lemma: Str} ; -- 2135
oper mkN : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> N =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17 ->
          { Def = table {
                    Sg => table {
                            Nom => f1 ;
                            Acc => f2 ;
                            Dat => f3 ;
                            Gen => f4
                          } ;
                    Pl => table {
                            Nom => f5 ;
                            Acc => f6 ;
                            Dat => f7 ;
                            Gen => f8
                          }
                  } ;
            Indef = table {
                      Sg => table {
                              Nom => f9 ;
                              Acc => f10 ;
                              Dat => f11 ;
                              Gen => f12
                            } ;
                      Pl => table {
                              Nom => f13 ;
                              Acc => f14 ;
                              Dat => f15 ;
                              Gen => f16
                            }
                    } ;
            lemma = f17
          } ;


param Case = Nom | Gen | Dat | Acc ;
param Number = Sg | Pl ;
oper A = {Fem: {Pl: Str; Sg: Case => Str}; Masc: Number => Case => Str; Neutr: {Pl: Str; Sg: Case => Str}; lemma: Str} ; -- 346
oper mkA : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> A =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19 ->
          { Fem = { Pl = f1 ;
                    Sg = table {
                           Nom => f2 ;
                           Acc => f3 ;
                           Dat => f4 ;
                           Gen => f5
                         }
                  } ;
            Masc = table {
                     Sg => table {
                             Nom => f6 ;
                             Acc => f7 ;
                             Dat => f8 ;
                             Gen => f9
                           } ;
                     Pl => table {
                             Nom => f10 ;
                             Acc => f11 ;
                             Dat => f12 ;
                             Gen => f13
                           }
                   } ;
            Neutr = { Pl = f14 ;
                      Sg = table {
                             Nom => f15 ;
                             Acc => f16 ;
                             Dat => f17 ;
                             Gen => f18
                           }
                    } ;
            lemma = f19
          } ;


param Number = Sg | Pl ;
param Tense = Past | Pres ;
param Person = P3 | P2 | P1 ;
oper V = {Converb: Str; Imperative_Jussive: Number => Str; Indicative: Tense => {Pl: Str; Sg: Person => Str}; Nonfinite: Str; Particle: Tense => Str; lemma: Str} ; -- 596
oper mkV : (_,_,_,_,_,_,_,_,_,_,_,_,_,_,_ : Str) -> V =
       \f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15 ->
          { Converb = f1 ;
            Imperative_Jussive = table {
                                   Sg => f2 ;
                                   Pl => f3
                                 } ;
            Indicative = table {
                           Pres => { Pl = f4 ;
                                     Sg = table {
                                            P1 => f5 ;
                                            P2 => f6 ;
                                            P3 => f7
                                          }
                                   } ;
                           Past => { Pl = f8 ;
                                     Sg = table {
                                            P1 => f9 ;
                                            P2 => f10 ;
                                            P3 => f11
                                          }
                                   }
                         } ;
            Nonfinite = f12 ;
            Particle = table {
                         Pres => f13 ;
                         Past => f14
                       } ;
            lemma = f15
          } ;



}
