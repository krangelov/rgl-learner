resource MorphoGla = open CatGla, ResGla, Predef in {

oper

mkN001 : Str -> Str -> N ;
mkN001 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN001"
  } ;

mkN002 : Str -> Str -> N ;
mkN002 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"achan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"achan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"achan"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"achan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN002"
  } ;

mkN003 : Str -> Str -> N ;
mkN003 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN003"
  } ;

mkN004 : Str -> Str -> N ;
mkN004 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN004"
  } ;

mkN005 : Str -> Str -> N ;
mkN005 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN005"
  } ;

mkN006 : Str -> Str -> N ;
mkN006 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN006"
  } ;

mkN007 : Str -> Str -> N ;
mkN007 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"a or orthachan or orrachan or orthannan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN007"
  } ;

mkN008 : Str -> Str -> N ;
mkN008 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN008"
  } ;

mkN009 : Str -> Str -> N ;
mkN009 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN009"
  } ;

mkN010 : Str -> Str -> N ;
mkN010 base form =
  case base of {
    base_1+"ia" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ia" ;
                                  Pl => base_1+"iathan"
                                } ;
                       Def => table {
                                Sg => base_1+"hè" ;
                                Pl => base_1+"hiatha"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ia" ;
                                  Pl => base_1+"iathan"
                                } ;
                       Def => table {
                                Sg => base_1+"ia" ;
                                Pl => base_1+"iathan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"hè" ;
                                  Pl => base_1+"hia"
                                } ;
                       Def => table {
                                Sg => base_1+"è" ;
                                Pl => base_1+"ia"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN010"
  } ;

mkN011 : Str -> Str -> N ;
mkN011 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => "h-"+pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN011"
  } ;

mkN012 : Str -> Str -> N ;
mkN012 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => base_1+"hea"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hea"+base_2 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"hea"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN012"
  } ;

mkN013 : Str -> Str -> N ;
mkN013 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"aidhean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN013"
  } ;

mkN014 : Str -> Str -> N ;
mkN014 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN014"
  } ;

mkN015 : Str -> Str -> N ;
mkN015 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN015"
  } ;

mkN016 : Str -> Str -> N ;
mkN016 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN016"
  } ;

mkN017 : Str -> Str -> N ;
mkN017 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN017"
  } ;

mkN018 : Str -> Str -> N ;
mkN018 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => base_1+"ha"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"ha"+base_2 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"ha"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hi"+base_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN018"
  } ;

mkN019 : Str -> Str -> N ;
mkN019 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => "h-"+pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN019"
  } ;

mkN020 : Str -> Str -> N ;
mkN020 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"chan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"chan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"chan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN020"
  } ;

mkN021 : Str -> Str -> N ;
mkN021 base form =
  case base of {
    "bea"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "bea"+base_1 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => "bhea"+base_1 ;
                                Pl => "mh"+base_1+"athan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => "bea"+base_1 ;
                                  Pl => "m"+base_1+"athan"
                                } ;
                       Def => table {
                                Sg => "bhea"+base_1 ;
                                Pl => "m"+base_1+"athan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "m"+base_1+"à" ;
                                  Pl => "ba"+base_1
                                } ;
                       Def => table {
                                Sg => "m"+base_1+"à" ;
                                Pl => "ba"+base_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN021"
  } ;

mkN022 : Str -> Str -> N ;
mkN022 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN022"
  } ;

mkN023 : Str -> Str -> N ;
mkN023 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"a"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN023"
  } ;

mkN024 : Str -> Str -> N ;
mkN024 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => "h-"+base_1+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1 ;
                                Pl => base_1+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN024"
  } ;

mkN025 : Str -> Str -> N ;
mkN025 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN025"
  } ;

mkN026 : Str -> Str -> N ;
mkN026 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN026"
  } ;

mkN027 : Str -> Str -> N ;
mkN027 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"than"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN027"
  } ;

mkN028 : Str -> Str -> N ;
mkN028 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN028"
  } ;

mkN029 : Str -> Str -> N ;
mkN029 base form =
  case <base, form> of {
    <pat_1, pat_2+"chan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"chan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"chan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"chan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"chan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN029"
  } ;

mkN030 : Str -> Str -> N ;
mkN030 base form =
  case <base, form> of {
    <pat_1+"r", pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"r" ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"r" ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"ir" ;
                                Pl => pat_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN030"
  } ;

mkN031 : Str -> Str -> N ;
mkN031 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"nnan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN031"
  } ;

mkN032 : Str -> Str -> N ;
mkN032 base form =
  case <base, form> of {
    <pat_1, pat_2+"tean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"tean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"oi"+base_3 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"oi"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"oi"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"oi"+base_3+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN032"
  } ;

mkN033 : Str -> Str -> N ;
mkN033 base form =
  case <base, form> of {
    <pat_1+"r", pat_2+"chean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"chean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN033"
  } ;

mkN034 : Str -> Str -> N ;
mkN034 base form =
  case <base, form> of {
    <pat_1+"s", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"s" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN034"
  } ;

mkN035 : Str -> Str -> N ;
mkN035 base form =
  case <base, form> of {
    <pat_1, pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"each" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"each" ;
                                Pl => pat_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN035"
  } ;

mkN036 : Str -> Str -> N ;
mkN036 base form =
  case <base, form> of {
    <pat_1, pat_2+"annan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"ha"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => pat_2+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"a" ;
                                  Pl => base_1+"ha"+base_2+"annan"
                                } ;
                       Def => table {
                                Sg => pat_2+"a" ;
                                Pl => pat_2+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN036"
  } ;

mkN037 : Str -> Str -> N ;
mkN037 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN037"
  } ;

mkN038 : Str -> Str -> N ;
mkN038 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN038"
  } ;

mkN039 : Str -> Str -> N ;
mkN039 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN039"
  } ;

mkN040 : Str -> Str -> N ;
mkN040 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN040"
  } ;

mkN041 : Str -> Str -> N ;
mkN041 base form =
  case base of {
    "a"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "a"+base_1 ;
                                  Pl => "ui"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN041"
  } ;

mkN042 : Str -> Str -> N ;
mkN042 base form =
  case <base, form> of {
    <pat_1, pat_2+"tan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"tan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"ta"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"tan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"tan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ;
                                Pl => pat_2
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN042"
  } ;

mkN043 : Str -> Str -> N ;
mkN043 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ; --guessed
                                  Pl => base_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"a" ; --guessed
                                Pl => base_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN043"
  } ;

mkN044 : Str -> Str -> N ;
mkN044 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => base_1+"h"+base_2+"o"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"o"+base_3 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+"o"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN044"
  } ;

mkN045 : Str -> Str -> N ;
mkN045 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN045"
  } ;

mkN046 : Str -> Str -> N ;
mkN046 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => "t-"+pat_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN046"
  } ;

mkN047 : Str -> Str -> N ;
mkN047 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN047"
  } ;

mkN048 : Str -> Str -> N ;
mkN048 base form =
  case base of {
    base_1+"a"+base_2@(?+?) => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => "è"+base_1+base_2
                                } ;
                       Def => table {
                                Sg => "è"+base_1+base_2 ;
                                Pl => base_1+"a"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a"+base_2 ;
                                  Pl => "è"+base_1+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"a"+base_2 ;
                                Pl => "h-è"+base_1+base_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => "è"+base_1+base_2 ;
                                  Pl => base_1+"a"+base_2
                                } ;
                       Def => table {
                                Sg => "è"+base_1+base_2 ;
                                Pl => base_1+"a"+base_2
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN048"
  } ;

mkN049 : Str -> Str -> N ;
mkN049 base form =
  case <base, form> of {
    <pat_1+"ch", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ch" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN049"
  } ;

mkN050 : Str -> Str -> N ;
mkN050 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN050"
  } ;

mkN051 : Str -> Str -> N ;
mkN051 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+base_2+"ui"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"ui"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"ui"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ui"+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN051"
  } ;

mkN052 : Str -> Str -> N ;
mkN052 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN052"
  } ;

mkN053 : Str -> Str -> N ;
mkN053 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_2+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN053"
  } ;

mkN054 : Str -> Str -> N ;
mkN054 base form =
  case base of {
    base_1+"ù" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ù" ;
                                  Pl => base_1+"oin"
                                } ;
                       Def => table {
                                Sg => base_1+"hoin" ;
                                Pl => base_1+"hona"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ù" ;
                                  Pl => base_1+"oin"
                                } ;
                       Def => table {
                                Sg => base_1+"hù" ;
                                Pl => base_1+"oin"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"oin" ;
                                  Pl => base_1+"hon"
                                } ;
                       Def => table {
                                Sg => base_1+"hoin" ;
                                Pl => base_1+"on"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN054"
  } ;

mkN055 : Str -> Str -> N ;
mkN055 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ainn" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ainn" ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN055"
  } ;

mkN056 : Str -> Str -> N ;
mkN056 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN056"
  } ;

mkN057 : Str -> Str -> N ;
mkN057 base form =
  case <base, form> of {
    <pat_1, pat_2+"e"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"e"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN057"
  } ;

mkN058 : Str -> Str -> N ;
mkN058 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN058"
  } ;

mkN059 : Str -> Str -> N ;
mkN059 base form =
  case base of {
    base_1+base_2@(?+?+?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN059"
  } ;

mkN060 : Str -> Str -> N ;
mkN060 base form =
  case <base, form> of {
    <pat_1, pat_2+"annan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ai"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"a" ;
                                  Pl => base_1+"h"+base_2+base_3+"annan"
                                } ;
                       Def => table {
                                Sg => pat_2+"a" ;
                                Pl => pat_2+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN060"
  } ;

mkN061 : Str -> Str -> N ;
mkN061 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3 ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN061"
  } ;

mkN062 : Str -> Str -> N ;
mkN062 base form =
  case <base, form> of {
    <pat_1, pat_2+"tean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"tean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN062"
  } ;

mkN063 : Str -> Str -> N ;
mkN063 base form =
  case base of {
    base_1+"ò" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ò" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => base_1+"hò" ;
                                Pl => base_1+"hà"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"ò" ;
                                  Pl => base_1+"à"
                                } ;
                       Def => table {
                                Sg => base_1+"hoin" ;
                                Pl => base_1+"à"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"à" ;
                                  Pl => base_1+"ò"
                                } ;
                       Def => table {
                                Sg => base_1+"à" ;
                                Pl => base_1+"ò"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN063"
  } ;

mkN064 : Str -> Str -> N ;
mkN064 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"idhean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN064"
  } ;

mkN065 : Str -> Str -> N ;
mkN065 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"rean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => "h-"+base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN065"
  } ;

mkN066 : Str -> Str -> N ;
mkN066 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN066"
  } ;

mkN067 : Str -> Str -> N ;
mkN067 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => pat_1+"a" ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN067"
  } ;

mkN068 : Str -> Str -> N ;
mkN068 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => "h-"+pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"i"+base_2+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN068"
  } ;

mkN069 : Str -> Str -> N ;
mkN069 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN069"
  } ;

mkN070 : Str -> Str -> N ;
mkN070 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hiu"+base_2+"a"+base_3 ;
                                Pl => base_1+"hea"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hiu"+base_2+"a"+base_3 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"ea"+base_2+"a"+base_3 ;
                                  Pl => base_1+"hea"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"ea"+base_2+"a"+base_3 ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN070"
  } ;

mkN071 : Str -> Str -> N ;
mkN071 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN071"
  } ;

mkN072 : Str -> Str -> N ;
mkN072 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN072"
  } ;

mkN073 : Str -> Str -> N ;
mkN073 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ai"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ai"+base_3 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"ach" ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"ach" ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN073"
  } ;

mkN074 : Str -> Str -> N ;
mkN074 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"n"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN074"
  } ;

mkN075 : Str -> Str -> N ;
mkN075 base form =
  case <base, form> of {
    <pat_1, pat_2+"ich"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ich"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ich"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ibh"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"ibh"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"ch" ;
                                  Pl => pat_1+"ch"
                                } ;
                       Def => table {
                                Sg => pat_1+"ch" ;
                                Pl => pat_1+"ch"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN075"
  } ;

mkN076 : Str -> Str -> N ;
mkN076 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_1+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN076"
  } ;

mkN077 : Str -> Str -> N ;
mkN077 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN077"
  } ;

mkN078 : Str -> Str -> N ;
mkN078 base form =
  case <base, form> of {
    <pat_1+"ir", pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ir" ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => base_1+"h"+base_2+"r"+base_3+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"r" ;
                                Pl => pat_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN078"
  } ;

mkN079 : Str -> Str -> N ;
mkN079 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN079"
  } ;

mkN080 : Str -> Str -> N ;
mkN080 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN080"
  } ;

mkN081 : Str -> Str -> N ;
mkN081 base form =
  case base of {
    base_1+"ì" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ì" ;
                                  Pl => base_1+"ithean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN081"
  } ;

mkN082 : Str -> Str -> N ;
mkN082 base form =
  case base of {
    base_1+"ì" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"ì" ;
                                  Pl => base_1+"itheachan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN082"
  } ;

mkN083 : Str -> Str -> N ;
mkN083 base form =
  case base of {
    "be"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "be"+base_1 ;
                                  Pl => "mnath"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN083"
  } ;

mkN084 : Str -> Str -> N ;
mkN084 base form =
  case <base, form> of {
    <pat_1, pat_2+"e"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"e"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN084"
  } ;

mkN085 : Str -> Str -> N ;
mkN085 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN085"
  } ;

mkN086 : Str -> Str -> N ;
mkN086 base form =
  case <base, form> of {
    <pat_1+"ir", pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"ir" ;
                                Pl => pat_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"ir" ;
                                Pl => "h-"+pat_2+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1+"r" ;
                                Pl => pat_2+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN086"
  } ;

mkN087 : Str -> Str -> N ;
mkN087 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN087"
  } ;

mkN088 : Str -> Str -> N ;
mkN088 base form =
  case <base, form> of {
    <pat_1+"l", pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"l" ;
                                  Pl => pat_2+"ichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN088"
  } ;

mkN089 : Str -> Str -> N ;
mkN089 base form =
  case <base, form> of {
    <pat_1+"id", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"id" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN089"
  } ;

mkN090 : Str -> Str -> N ;
mkN090 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"nnan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"nnan"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"nnan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"nnan"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"nnan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN090"
  } ;

mkN091 : Str -> Str -> N ;
mkN091 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+base_5+"n" ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+base_5
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+base_5+"n" ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+base_4+"i"+base_5+"n" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+base_5
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+base_4+"i"+base_5+"n" ;
                                Pl => pat_2
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN091"
  } ;

mkN092 : Str -> Str -> N ;
mkN092 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN092"
  } ;

mkN093 : Str -> Str -> N ;
mkN093 base form =
  case base of {
    "o"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "o"+base_1 ;
                                  Pl => "ui"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN093"
  } ;

mkN094 : Str -> Str -> N ;
mkN094 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN094"
  } ;

mkN095 : Str -> Str -> N ;
mkN095 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN095"
  } ;

mkN096 : Str -> Str -> N ;
mkN096 base form =
  case <base, form> of {
    <pat_1+"d", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"d" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN096"
  } ;

mkN097 : Str -> Str -> N ;
mkN097 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN097"
  } ;

mkN098 : Str -> Str -> N ;
mkN098 base form =
  case <base, form> of {
    <pat_1+"dh", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"dh" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN098"
  } ;

mkN099 : Str -> Str -> N ;
mkN099 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN099"
  } ;

mkN100 : Str -> Str -> N ;
mkN100 base form =
  case base of {
    "nea"+base_1@(?+?)+base_2 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "nea"+base_1+base_2 ;
                                  Pl => "lu"+base_1+"d"+base_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN100"
  } ;

mkN101 : Str -> Str -> N ;
mkN101 base form =
  case base of {
    "nea"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "nea"+base_1 ;
                                  Pl => "lu"+base_1+"d"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN101"
  } ;

mkN102 : Str -> Str -> N ;
mkN102 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN102"
  } ;

mkN103 : Str -> Str -> N ;
mkN103 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN103"
  } ;

mkN104 : Str -> Str -> N ;
mkN104 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN104"
  } ;

mkN105 : Str -> Str -> N ;
mkN105 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN105"
  } ;

mkN106 : Str -> Str -> N ;
mkN106 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN106"
  } ;

mkN107 : Str -> Str -> N ;
mkN107 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN107"
  } ;

mkN108 : Str -> Str -> N ;
mkN108 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN108"
  } ;

mkN109 : Str -> Str -> N ;
mkN109 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN109"
  } ;

mkN110 : Str -> Str -> N ;
mkN110 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN110"
  } ;

mkN111 : Str -> Str -> N ;
mkN111 base form =
  case <base, form> of {
    <pat_1+"ir", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ir" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN111"
  } ;

mkN112 : Str -> Str -> N ;
mkN112 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN112"
  } ;

mkN113 : Str -> Str -> N ;
mkN113 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ai"+base_4 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+base_4+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ai"+base_4 ;
                                Pl => pat_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a"+base_4 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+base_4+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"a"+base_4 ;
                                Pl => pat_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN113"
  } ;

mkN114 : Str -> Str -> N ;
mkN114 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN114"
  } ;

mkN115 : Str -> Str -> N ;
mkN115 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN115"
  } ;

mkN116 : Str -> Str -> N ;
mkN116 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN116"
  } ;

mkN117 : Str -> Str -> N ;
mkN117 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN117"
  } ;

mkN118 : Str -> Str -> N ;
mkN118 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN118"
  } ;

mkN119 : Str -> Str -> N ;
mkN119 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN119"
  } ;

mkN120 : Str -> Str -> N ;
mkN120 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN120"
  } ;

mkN121 : Str -> Str -> N ;
mkN121 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hè"+base_2+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"hè"+base_2+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN121"
  } ;

mkN122 : Str -> Str -> N ;
mkN122 base form =
  case <base, form> of {
    <pat_1+"ll", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ll" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN122"
  } ;

mkN123 : Str -> Str -> N ;
mkN123 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN123"
  } ;

mkN124 : Str -> Str -> N ;
mkN124 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"ea"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN124"
  } ;

mkN125 : Str -> Str -> N ;
mkN125 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => "h-"+pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => pat_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN125"
  } ;

mkN126 : Str -> Str -> N ;
mkN126 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN126"
  } ;

mkN127 : Str -> Str -> N ;
mkN127 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ; --guessed
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ; --guessed
                                Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ; --guessed
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ; --guessed
                                Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN127"
  } ;

mkN128 : Str -> Str -> N ;
mkN128 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN128"
  } ;

mkN129 : Str -> Str -> N ;
mkN129 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"dhean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"e" ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN129"
  } ;

mkN130 : Str -> Str -> N ;
mkN130 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN130"
  } ;

mkN131 : Str -> Str -> N ;
mkN131 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"a" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN131"
  } ;

mkN132 : Str -> Str -> N ;
mkN132 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN132"
  } ;

mkN133 : Str -> Str -> N ;
mkN133 base form =
  case <base, form> of {
    <pat_1+"ù", pat_2+"ùthan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ù" ;
                                  Pl => pat_1+"ùthan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ù" ;
                                Pl => base_1+"h"+base_2+"ùtha"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"oinn" ;
                                  Pl => pat_1+"onnaibh"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"oinn" ;
                                Pl => pat_1+"onnaibh"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"onn" ;
                                  Pl => base_1+"h"+base_2+"onn"
                                } ;
                       Def => table {
                                Sg => pat_1+"onn" ;
                                Pl => pat_1+"onn"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN133"
  } ;

mkN134 : Str -> Str -> N ;
mkN134 base form =
  case base of {
    base_1+base_2@(?+?)+"i"+base_3@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"a" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"a" ;
                                Pl => base_1+base_2+"i"+base_3+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN134"
  } ;

mkN135 : Str -> Str -> N ;
mkN135 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN135"
  } ;

mkN136 : Str -> Str -> N ;
mkN136 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN136"
  } ;

mkN137 : Str -> Str -> N ;
mkN137 base form =
  case <base, form> of {
    <pat_1+"r", pat_2+"chan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"chan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN137"
  } ;

mkN138 : Str -> Str -> N ;
mkN138 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN138"
  } ;

mkN139 : Str -> Str -> N ;
mkN139 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN139"
  } ;

mkN140 : Str -> Str -> N ;
mkN140 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN140"
  } ;

mkN141 : Str -> Str -> N ;
mkN141 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN141"
  } ;

mkN142 : Str -> Str -> N ;
mkN142 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => "h-"+base_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"an"
                                } ;
                       Def => table {
                                Sg => "h-"+base_1+"a" ;
                                Pl => base_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN142"
  } ;

mkN143 : Str -> Str -> N ;
mkN143 base form =
  case <base, form> of {
    <pat_1+"ill", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ill" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN143"
  } ;

mkN144 : Str -> Str -> N ;
mkN144 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => pat_2+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"inn" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4+"inn" ;
                                Pl => pat_2+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN144"
  } ;

mkN145 : Str -> Str -> N ;
mkN145 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN145"
  } ;

mkN146 : Str -> Str -> N ;
mkN146 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN146"
  } ;

mkN147 : Str -> Str -> N ;
mkN147 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN147"
  } ;

mkN148 : Str -> Str -> N ;
mkN148 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN148"
  } ;

mkN149 : Str -> Str -> N ;
mkN149 base form =
  case base of {
    "u"+base_1+"a"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "u"+base_1+"a"+base_2 ;
                                  Pl => "ù"+base_1+base_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN149"
  } ;

mkN150 : Str -> Str -> N ;
mkN150 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"a" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN150"
  } ;

mkN151 : Str -> Str -> N ;
mkN151 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN151"
  } ;

mkN152 : Str -> Str -> N ;
mkN152 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN152"
  } ;

mkN153 : Str -> Str -> N ;
mkN153 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"a" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN153"
  } ;

mkN154 : Str -> Str -> N ;
mkN154 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN154"
  } ;

mkN155 : Str -> Str -> N ;
mkN155 base form =
  case <base, form> of {
    <pat_1, pat_2+"annan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN155"
  } ;

mkN156 : Str -> Str -> N ;
mkN156 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN156"
  } ;

mkN157 : Str -> Str -> N ;
mkN157 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+base_2+"i"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+base_2+"i"+base_3
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN157"
  } ;

mkN158 : Str -> Str -> N ;
mkN158 base form =
  case <base, form> of {
    <pat_1+"l", pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"l" ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN158"
  } ;

mkN159 : Str -> Str -> N ;
mkN159 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"heòi"+base_2 ;
                                Pl => base_1+"hèa"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hèa"+base_2 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"hèa"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"heòi"+base_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN159"
  } ;

mkN160 : Str -> Str -> N ;
mkN160 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN160"
  } ;

mkN161 : Str -> Str -> N ;
mkN161 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN161"
  } ;

mkN162 : Str -> Str -> N ;
mkN162 base form =
  case <base, form> of {
    <pat_1+"r", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"r" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN162"
  } ;

mkN163 : Str -> Str -> N ;
mkN163 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"thaichean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN163"
  } ;

mkN164 : Str -> Str -> N ;
mkN164 base form =
  case base of {
    base_1+"s" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"s" ;
                                  Pl => base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN164"
  } ;

mkN165 : Str -> Str -> N ;
mkN165 base form =
  case <base, form> of {
    <pat_1+"l", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"l" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN165"
  } ;

mkN166 : Str -> Str -> N ;
mkN166 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => base_1+"ho"+base_2+"aiche"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"hui"+base_2 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"ach" ;
                                  Pl => base_1+"ho"+base_2+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"ach" ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN166"
  } ;

mkN167 : Str -> Str -> N ;
mkN167 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"innean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN167"
  } ;

mkN168 : Str -> Str -> N ;
mkN168 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN168"
  } ;

mkN169 : Str -> Str -> N ;
mkN169 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ;
                                  Pl => base_1+"i"+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ;
                                Pl => base_1+"i"+base_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2+"e" ;
                                  Pl => pat_1
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN169"
  } ;

mkN170 : Str -> Str -> N ;
mkN170 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"dhan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"e" ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"e" ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN170"
  } ;

mkN171 : Str -> Str -> N ;
mkN171 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ; --guessed
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ; --guessed
                                Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ; --guessed
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ; --guessed
                                Pl => base_1+base_2+"i"+base_3+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN171"
  } ;

mkN172 : Str -> Str -> N ;
mkN172 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN172"
  } ;

mkN173 : Str -> Str -> N ;
mkN173 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN173"
  } ;

mkN174 : Str -> Str -> N ;
mkN174 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN174"
  } ;

mkN175 : Str -> Str -> N ;
mkN175 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"annan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"annan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"a" ;
                                  Pl => base_1+"annan"
                                } ;
                       Def => table {
                                Sg => base_1+"a" ;
                                Pl => base_1+"annan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN175"
  } ;

mkN176 : Str -> Str -> N ;
mkN176 base form =
  case base of {
    "à"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "à"+base_1 ;
                                  Pl => "a"+base_1+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN176"
  } ;

mkN177 : Str -> Str -> N ;
mkN177 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN177"
  } ;

mkN178 : Str -> Str -> N ;
mkN178 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => base_1+"h"+base_2+"ea"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"e" ;
                                  Pl => base_1+"h"+base_2+"ea"+base_3
                                } ;
                       Def => table {
                                Sg => pat_2+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN178"
  } ;

mkN179 : Str -> Str -> N ;
mkN179 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ad" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+base_2+base_3+"ad" ;
                                Pl => pat_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN179"
  } ;

mkN180 : Str -> Str -> N ;
mkN180 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN180"
  } ;

mkN181 : Str -> Str -> N ;
mkN181 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN181"
  } ;

mkN182 : Str -> Str -> N ;
mkN182 base form =
  case <base, form> of {
    <pat_1, pat_2+"eachan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"eachan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"eachan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+base_3+"ad" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+"ad" ;
                                Pl => pat_1+"eachan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN182"
  } ;

mkN183 : Str -> Str -> N ;
mkN183 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN183"
  } ;

mkN184 : Str -> Str -> N ;
mkN184 base form =
  case <base, form> of {
    <pat_1, pat_2+"e"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"e"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN184"
  } ;

mkN185 : Str -> Str -> N ;
mkN185 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN185"
  } ;

mkN186 : Str -> Str -> N ;
mkN186 base form =
  case <base, form> of {
    <pat_1, pat_2+"hean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"hean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"a" ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a" ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"a" ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"a" ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN186"
  } ;

mkN187 : Str -> Str -> N ;
mkN187 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"à"+base_3 ;
                                Pl => base_1+"h"+base_2+"à"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"à"+base_3+"a" ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => base_1+"h"+base_2+"à"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => pat_1+"a" ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN187"
  } ;

mkN188 : Str -> Str -> N ;
mkN188 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN188"
  } ;

mkN189 : Str -> Str -> N ;
mkN189 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN189"
  } ;

mkN190 : Str -> Str -> N ;
mkN190 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3 ;
                                Pl => pat_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN190"
  } ;

mkN191 : Str -> Str -> N ;
mkN191 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN191"
  } ;

mkN192 : Str -> Str -> N ;
mkN192 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN192"
  } ;

mkN193 : Str -> Str -> N ;
mkN193 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"nan"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"ean"
                                } ;
                       Def => table {
                                Sg => base_1 ;
                                Pl => base_1+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN193"
  } ;

mkN194 : Str -> Str -> N ;
mkN194 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => pat_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN194"
  } ;

mkN195 : Str -> Str -> N ;
mkN195 base form =
  case base of {
    "io"+base_1+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "io"+base_1+base_2 ;
                                  Pl => "ì"+base_1+"ne"+base_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN195"
  } ;

mkN196 : Str -> Str -> N ;
mkN196 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN196"
  } ;

mkN197 : Str -> Str -> N ;
mkN197 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN197"
  } ;

mkN198 : Str -> Str -> N ;
mkN198 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN198"
  } ;

mkN199 : Str -> Str -> N ;
mkN199 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN199"
  } ;

mkN200 : Str -> Str -> N ;
mkN200 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hùi"+base_2 ;
                                Pl => base_1+"hà"+base_2+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"hà"+base_2 ;
                                Pl => pat_2
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"hà"+base_2
                                } ;
                       Def => table {
                                Sg => base_1+"hùi"+base_2 ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN200"
  } ;

mkN201 : Str -> Str -> N ;
mkN201 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN201"
  } ;

mkN202 : Str -> Str -> N ;
mkN202 base form =
  case base of {
    "ò"+base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "ò"+base_1 ;
                                  Pl => "ùi"+base_1
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN202"
  } ;

mkN203 : Str -> Str -> N ;
mkN203 base form =
  case base of {
    base_1+"u" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"u" ;
                                  Pl => base_1+"othan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN203"
  } ;

mkN204 : Str -> Str -> N ;
mkN204 base form =
  case <base, form> of {
    <pat_1+"thad", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"thad" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN204"
  } ;

mkN205 : Str -> Str -> N ;
mkN205 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN205"
  } ;

mkN206 : Str -> Str -> N ;
mkN206 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN206"
  } ;

mkN207 : Str -> Str -> N ;
mkN207 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN207"
  } ;

mkN208 : Str -> Str -> N ;
mkN208 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"en"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN208"
  } ;

mkN209 : Str -> Str -> N ;
mkN209 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"a"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"a"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3+"e" ;
                                  Pl => base_1+"h"+base_2+"a"+base_3
                                } ;
                       Def => table {
                                Sg => base_1+base_2+"i"+base_3+"e" ;
                                Pl => pat_1
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN209"
  } ;

mkN210 : Str -> Str -> N ;
mkN210 base form =
  case <base, form> of {
    <pat_1+"inn", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"inn" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN210"
  } ;

mkN211 : Str -> Str -> N ;
mkN211 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"tha"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN211"
  } ;

mkN212 : Str -> Str -> N ;
mkN212 base form =
  case <base, form> of {
    <pat_1, pat_2+"thntan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"thntan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"thntan"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"thntan"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"thntan"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"than" ;
                                  Pl => base_1+"h"+base_2+"thntan"
                                } ;
                       Def => table {
                                Sg => pat_1+"than" ;
                                Pl => pat_1+"thntan"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN212"
  } ;

mkN213 : Str -> Str -> N ;
mkN213 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN213"
  } ;

mkN214 : Str -> Str -> N ;
mkN214 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN214"
  } ;

mkN215 : Str -> Str -> N ;
mkN215 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN215"
  } ;

mkN216 : Str -> Str -> N ;
mkN216 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN216"
  } ;

mkN217 : Str -> Str -> N ;
mkN217 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN217"
  } ;

mkN218 : Str -> Str -> N ;
mkN218 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN218"
  } ;

mkN219 : Str -> Str -> N ;
mkN219 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN219"
  } ;

mkN220 : Str -> Str -> N ;
mkN220 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"ach" ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"ach" ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN220"
  } ;

mkN221 : Str -> Str -> N ;
mkN221 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN221"
  } ;

mkN222 : Str -> Str -> N ;
mkN222 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN222"
  } ;

mkN223 : Str -> Str -> N ;
mkN223 base form =
  case <base, form> of {
    <pat_1+"ac", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ac" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN223"
  } ;

mkN224 : Str -> Str -> N ;
mkN224 base form =
  case <base, form> of {
    <pat_1+"l", pat_2+"chean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"l" ;
                                  Pl => pat_2+"chean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN224"
  } ;

mkN225 : Str -> Str -> N ;
mkN225 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN225"
  } ;

mkN226 : Str -> Str -> N ;
mkN226 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN226"
  } ;

mkN227 : Str -> Str -> N ;
mkN227 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"a"+base_3+"an"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+pat_1 ;
                                Pl => pat_1+"an"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+base_2+"i"+base_3 ;
                                  Pl => base_1+"h"+base_2+"a"+base_3+"an"
                                } ;
                       Def => table {
                                Sg => "t-"+base_1+base_2+"i"+base_3 ;
                                Pl => pat_1+"an"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN227"
  } ;

mkN228 : Str -> Str -> N ;
mkN228 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN228"
  } ;

mkN229 : Str -> Str -> N ;
mkN229 base form =
  case <base, form> of {
    <pat_1+"a", pat_2+"o"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"a" ;
                                  Pl => pat_2+"o"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN229"
  } ;

mkN230 : Str -> Str -> N ;
mkN230 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN230"
  } ;

mkN231 : Str -> Str -> N ;
mkN231 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN231"
  } ;

mkN232 : Str -> Str -> N ;
mkN232 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN232"
  } ;

mkN233 : Str -> Str -> N ;
mkN233 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN233"
  } ;

mkN234 : Str -> Str -> N ;
mkN234 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN234"
  } ;

mkN235 : Str -> Str -> N ;
mkN235 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN235"
  } ;

mkN236 : Str -> Str -> N ;
mkN236 base form =
  case <base, form> of {
    <pat_1, pat_2+"tan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"tan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN236"
  } ;

mkN237 : Str -> Str -> N ;
mkN237 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eannan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN237"
  } ;

mkN238 : Str -> Str -> N ;
mkN238 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN238"
  } ;

mkN239 : Str -> Str -> N ;
mkN239 base form =
  case <base, form> of {
    <pat_1, pat_2+"ichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"ichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"ichean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_1+"ichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN239"
  } ;

mkN240 : Str -> Str -> N ;
mkN240 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN240"
  } ;

mkN241 : Str -> Str -> N ;
mkN241 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"an" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"an" --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"h"+base_2+"an" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"an" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN241"
  } ;

mkN242 : Str -> Str -> N ;
mkN242 base form =
  case base of {
    base_1+"dha" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"dha" ;
                                  Pl => "àine"+base_1+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN242"
  } ;

mkN243 : Str -> Str -> N ;
mkN243 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN243"
  } ;

mkN244 : Str -> Str -> N ;
mkN244 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN244"
  } ;

mkN245 : Str -> Str -> N ;
mkN245 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN245"
  } ;

mkN246 : Str -> Str -> N ;
mkN246 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN246"
  } ;

mkN247 : Str -> Str -> N ;
mkN247 base form =
  case <base, form> of {
    <pat_1+"ll", pat_2+"chan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"ll" ;
                                  Pl => pat_2+"chan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN247"
  } ;

mkN248 : Str -> Str -> N ;
mkN248 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN248"
  } ;

mkN249 : Str -> Str -> N ;
mkN249 base form =
  case <base, form> of {
    <pat_1, pat_2+"e"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"e"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"a" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN249"
  } ;

mkN250 : Str -> Str -> N ;
mkN250 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN250"
  } ;

mkN251 : Str -> Str -> N ;
mkN251 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN251"
  } ;

mkN252 : Str -> Str -> N ;
mkN252 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"a" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN252"
  } ;

mkN253 : Str -> Str -> N ;
mkN253 base form =
  case <base, form> of {
    <pat_1, pat_2+"annan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN253"
  } ;

mkN254 : Str -> Str -> N ;
mkN254 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN254"
  } ;

mkN255 : Str -> Str -> N ;
mkN255 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN255"
  } ;

mkN256 : Str -> Str -> N ;
mkN256 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN256"
  } ;

mkN257 : Str -> Str -> N ;
mkN257 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN257"
  } ;

mkN258 : Str -> Str -> N ;
mkN258 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1+"a" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => base_1+"i"+base_2 --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => "h-"+base_1+"i"+base_2 --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1+"i"+base_2 ; --guessed
                                  Pl => pat_1 --guessed
                                } ;
                       Def => table {
                                Sg => base_1+"i"+base_2 ; --guessed
                                Pl => pat_1 --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN258"
  } ;

mkN259 : Str -> Str -> N ;
mkN259 base form =
  case <base, form> of {
    <pat_1, pat_2+"eannan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"eannan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN259"
  } ;

mkN260 : Str -> Str -> N ;
mkN260 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => base_1+"h"+base_2+"than"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_1+"than"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"than"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => base_1+"h"+base_2+"than"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ;
                                Pl => pat_1+"than"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN260"
  } ;

mkN261 : Str -> Str -> N ;
mkN261 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN261"
  } ;

mkN262 : Str -> Str -> N ;
mkN262 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN262"
  } ;

mkN263 : Str -> Str -> N ;
mkN263 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"aiche"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"ach" ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"ach" ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN263"
  } ;

mkN264 : Str -> Str -> N ;
mkN264 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN264"
  } ;

mkN265 : Str -> Str -> N ;
mkN265 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN265"
  } ;

mkN266 : Str -> Str -> N ;
mkN266 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"thean"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN266"
  } ;

mkN267 : Str -> Str -> N ;
mkN267 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN267"
  } ;

mkN268 : Str -> Str -> N ;
mkN268 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN268"
  } ;

mkN269 : Str -> Str -> N ;
mkN269 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN269"
  } ;

mkN270 : Str -> Str -> N ;
mkN270 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN270"
  } ;

mkN271 : Str -> Str -> N ;
mkN271 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN271"
  } ;

mkN272 : Str -> Str -> N ;
mkN272 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN272"
  } ;

mkN273 : Str -> Str -> N ;
mkN273 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN273"
  } ;

mkN274 : Str -> Str -> N ;
mkN274 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN274"
  } ;

mkN275 : Str -> Str -> N ;
mkN275 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"eachan"
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => base_1 ; --guessed
                                  Pl => base_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => base_1 ; --guessed
                                Pl => base_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN275"
  } ;

mkN276 : Str -> Str -> N ;
mkN276 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN276"
  } ;

mkN277 : Str -> Str -> N ;
mkN277 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN277"
  } ;

mkN278 : Str -> Str -> N ;
mkN278 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN278"
  } ;

mkN279 : Str -> Str -> N ;
mkN279 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN279"
  } ;

mkN280 : Str -> Str -> N ;
mkN280 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN280"
  } ;

mkN281 : Str -> Str -> N ;
mkN281 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN281"
  } ;

mkN282 : Str -> Str -> N ;
mkN282 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN282"
  } ;

mkN283 : Str -> Str -> N ;
mkN283 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN283"
  } ;

mkN284 : Str -> Str -> N ;
mkN284 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN284"
  } ;

mkN285 : Str -> Str -> N ;
mkN285 base form =
  case <base, form> of {
    <pat_1+"id", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"id" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN285"
  } ;

mkN286 : Str -> Str -> N ;
mkN286 base form =
  case <base, form> of {
    <pat_1+" còinnich", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+" còinnich" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN286"
  } ;

mkN287 : Str -> Str -> N ;
mkN287 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN287"
  } ;

mkN288 : Str -> Str -> N ;
mkN288 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN288"
  } ;

mkN289 : Str -> Str -> N ;
mkN289 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN289"
  } ;

mkN290 : Str -> Str -> N ;
mkN290 base form =
  case <base, form> of {
    <pat_1, pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+base_3+base_4 ;
                                Pl => pat_2+"n"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"inn" ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ne"+base_4+"n"
                                } ;
                       Def => table {
                                Sg => pat_1+"inn" ;
                                Pl => pat_2+"n"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN290"
  } ;

mkN291 : Str -> Str -> N ;
mkN291 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN291"
  } ;

mkN292 : Str -> Str -> N ;
mkN292 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN292"
  } ;

mkN293 : Str -> Str -> N ;
mkN293 base form =
  case <base, form> of {
    <pat_1+"id", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"id" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN293"
  } ;

mkN294 : Str -> Str -> N ;
mkN294 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN294"
  } ;

mkN295 : Str -> Str -> N ;
mkN295 base form =
  case base of {
    "e"+base_1+"i"+base_2@? => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "e"+base_1+"i"+base_2 ;
                                  Pl => "è"+base_1+base_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN295"
  } ;

mkN296 : Str -> Str -> N ;
mkN296 base form =
  case base of {
    base_1+"l" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1+"l" ;
                                  Pl => base_1+"gais"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN296"
  } ;

mkN297 : Str -> Str -> N ;
mkN297 base form =
  case <base, form> of {
    <pat_1+"l", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"l" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN297"
  } ;

mkN298 : Str -> Str -> N ;
mkN298 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN298"
  } ;

mkN299 : Str -> Str -> N ;
mkN299 base form =
  case base of {
    "marcachd" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "marcachd" ;
                                  Pl => "--"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN299"
  } ;

mkN300 : Str -> Str -> N ;
mkN300 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ea"+base_3 ;
                                Pl => pat_2+"ean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2 ;
                                  Pl => base_1+"h"+base_2+"i"+base_3+"ean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"i"+base_3 ;
                                Pl => pat_2+"ean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN300"
  } ;

mkN301 : Str -> Str -> N ;
mkN301 base form =
  case <base, form> of {
    <pat_1, pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN301"
  } ;

mkN302 : Str -> Str -> N ;
mkN302 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"e"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN302"
  } ;

mkN303 : Str -> Str -> N ;
mkN303 base form =
  case <base, form> of {
    <pat_1+"st", pat_2+"n"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"st" ;
                                  Pl => pat_2+"n"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN303"
  } ;

mkN304 : Str -> Str -> N ;
mkN304 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN304"
  } ;

mkN305 : Str -> Str -> N ;
mkN305 base form =
  case <base, form> of {
    <pat_1, pat_2+"a"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"a"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN305"
  } ;

mkN306 : Str -> Str -> N ;
mkN306 base form =
  case <base, form> of {
    <pat_1+"n", pat_2> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1+"n" ;
                                  Pl => pat_2
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN306"
  } ;

mkN307 : Str -> Str -> N ;
mkN307 base form =
  case <base, form> of {
    <pat_1, pat_2+"annan"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"annan"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN307"
  } ;

mkN308 : Str -> Str -> N ;
mkN308 base form =
  case base of {
    "eò" => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => "eò" ;
                                  Pl => "iach"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN308"
  } ;

mkN309 : Str -> Str -> N ;
mkN309 base form =
  case <base, form> of {
    <pat_1, pat_2+"aichean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2+"ai"+base_3 ;
                                Pl => base_1+"h"+base_2+base_3+"aichean"
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_1 ;
                                Pl => pat_2+"aichean"
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_2+"ach" ;
                                  Pl => base_1+"h"+base_2+base_3+"aichean"
                                } ;
                       Def => table {
                                Sg => pat_2+"ach" ;
                                Pl => pat_2+"aichean"
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN309"
  } ;

mkN310 : Str -> Str -> N ;
mkN310 base form =
  case <base, form> of {
    <pat_1, pat_2+"than"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"than"
                                } ;
                       Def => table {
                                Sg => base_1+"h"+base_2 ; --guessed
                                Pl => base_1+"h"+base_2+"ean" --guessed
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => pat_1 ; --guessed
                                  Pl => pat_1+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1 ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => pat_1+"e" ; --guessed
                                  Pl => base_1+"h"+base_2+"ean" --guessed
                                } ;
                       Def => table {
                                Sg => pat_1+"e" ; --guessed
                                Pl => pat_1+"ean" --guessed
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN310"
  } ;

mkN311 : Str -> Str -> N ;
mkN311 base form =
  case base of {
    base_1 => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => base_1 ;
                                  Pl => base_1+"s"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN311"
  } ;

mkN312 : Str -> Str -> N ;
mkN312 base form =
  case <base, form> of {
    <pat_1, pat_2+"an"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"an"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN312"
  } ;

mkN313 : Str -> Str -> N ;
mkN313 base form =
  case <base, form> of {
    <pat_1, pat_2+"ean"> => lin N
      { s = table {
              Nom => table {
                       Indef => table {
                                  Sg => pat_1 ;
                                  Pl => pat_2+"ean"
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Dat => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     } ;
              Gen => table {
                       Indef => table {
                                  Sg => nonExist ;
                                  Pl => nonExist
                                } ;
                       Def => table {
                                Sg => nonExist ;
                                Pl => nonExist
                              }
                     }
            } ;
        voc = table {
                Sg => nonExist ;
                Pl => nonExist
              } ;
        g = Masc
      };
    _ => error "Can't apply paradigm mkN313"
  } ;
}