concrete PhraseGla of Phrase = CatGla ** {
lin
  PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;

  UttS s = s ;
  UttInterj i = i ;

  NoPConj = {s = []} ;

  NoVoc = {s = []} ;
}
