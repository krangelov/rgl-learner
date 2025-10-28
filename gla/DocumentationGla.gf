concrete DocumentationGla of Documentation = CatGla ** open
  ResGla, Prelude, HTML in {

lincat
  Inflection = {t : Str; s1,s2,s3 : Str} ;
  Definition = {s : Str} ;
  Document   = {s : Str} ;
  Tag        = {s : Str} ;

lin
  InflectionN,InflectionN2,InflectionN3 = \x -> {
      t="n" ;
      s1="" ;
      s2=frameTable (
           tr (intagAttr "th" "rowspan=\"12\"" "s" ++ intagAttr "th" "rowspan=\"4\"" "Nom" ++ intagAttr "th" "rowspan=\"2\"" "Indef" ++ th "Sg" ++ td (x.s ! Nom ! Indef ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Nom ! Indef ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Def" ++ th "Sg" ++ td (x.s ! Nom ! Def ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Nom ! Def ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"4\"" "Dat" ++ intagAttr "th" "rowspan=\"2\"" "Indef" ++ th "Sg" ++ td (x.s ! Dat ! Indef ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Dat ! Indef ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Def" ++ th "Sg" ++ td (x.s ! Dat ! Def ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Dat ! Def ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"4\"" "Gen" ++ intagAttr "th" "rowspan=\"2\"" "Indef" ++ th "Sg" ++ td (x.s ! Gen ! Indef ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Gen ! Indef ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Def" ++ th "Sg" ++ td (x.s ! Gen ! Def ! Sg)) ++
           tr (th "Pl" ++ td (x.s ! Gen ! Def ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "voc" ++ th "Sg" ++ td (x.voc ! Sg)) ++
           tr (th "Pl" ++ td (x.voc ! Pl))) ;
      s3=[]
    } ;
lin
  InflectionV,InflectionV2,InflectionV2A,InflectionV2Q,InflectionV2S,InflectionV2V,InflectionV3,InflectionVA,InflectionVQ,InflectionVS,InflectionVV = \x -> {
      t="v" ;
      s1="" ;
      s2=frameTable (
           tr (th "s" ++ td (x.s)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "Conditional" ++ th "Sg" ++ td (x.conditional ! Sg)) ++
           tr (th "Pl" ++ td (x.conditional ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"6\"" "Imperative" ++ intagAttr "th" "rowspan=\"2\"" "P1" ++ th "Sg" ++ td (x.imperative ! P1 ! Sg)) ++
           tr (th "Pl" ++ td (x.imperative ! P1 ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "P2" ++ th "Sg" ++ td (x.imperative ! P2 ! Sg)) ++
           tr (th "Pl" ++ td (x.imperative ! P2 ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "P3" ++ th "Sg" ++ td (x.imperative ! P3 ! Sg)) ++
           tr (th "Pl" ++ td (x.imperative ! P3 ! Pl)) ++
           tr (intagAttr "th" "rowspan=\"4\"" "Indicative" ++ th "Fut" ++ td (x.future ! Indep)) ++
           tr (th "Past" ++ td (x.past ! Indep)) ++
           tr (th "Participle" ++ td (x.participle))) ;
      s3=[]
    } ;
lin
  InflectionA,InflectionA2 = \x -> {
      t="a" ;
      s1="" ;
      s2=heading1 "Adjective" ++
         frameTable (
           tr (intagAttr "th" "rowspan=\"2\"" "" ++ 
                           th "masculine" ++ th "feminine") ++
           tr (intagAttr "th" "colspan=\"2\"" "singular") ++
           tr (th "Nom" ++ td (x.s ! ASg Nom Masc) ++ td (x.s ! ASg Nom Fem)) ++
           tr (th "Dat" ++ td (x.s ! ASg Dat Masc) ++ td (x.s ! ASg Dat Fem)) ++
           tr (th "Gen" ++ td (x.s ! ASg Gen Masc) ++ td (x.s ! ASg Gen Fem)) ++
           tr (th "Voc" ++ td (x.voc ! Masc)       ++ td (x.voc ! Fem)) ++
           tr (intagAttr "th" "rowspan=\"2\"" "" ++ intagAttr "th" "colspan=\"2\"" "plural") ++
           tr (                                     intagAttr "td" "colspan=\"2\""  (x.s ! APl))) ++
         heading2 "Comparative" ++
         paragraph (x.compar) ;
      s3=[]
    } ;

lin
  NoDefinition   t     = {s=t.s};
  MkDefinition   t d   = {s="<p><b>Definition:</b>"++t.s++d.s++"</p>"};
  MkDefinitionEx t d e = {s="<p><b>Definition:</b>"++t.s++d.s++"</p><p><b>Example:</b>"++e.s++"</p>"};

lin
  MkDocument d i e = {s = i.s1 ++ d.s ++ i.s2 ++ i.s3 ++ e.s} ;
  MkTag i = {s = i.t} ;
}
