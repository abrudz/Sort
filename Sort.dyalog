:Namespace Sort
    ⎕ML←1

    Classic←{⎕AV ⍺⍺ Sort Mix ⍵}

      Natural←{
          Digits←∊∘⎕D
          CutOffs←1,2≠/Digits
          Parts←CutOffs⊂⊢
          ExecNums←{⊃⊃⎕VFI ⍵:⍎⍵ ⋄ ⍵}
          Norm←ExecNums¨∘Parts¨
          ⍺⍺ Sort Norm ⍵
      }

      Danish←{
          abc←'ÁÉÍÓÚÝǼǾ○'VariantsOf'AEIOUYÆØÅ'⊢' ',⎕A,'ÆØÅ'
          Norm←'aa' 'Aa' 'AA'⎕R(,¨'ӑӐӐ')
          abc ⍺⍺ Sort Norm ⍵
      }

      Finnish←{ ⍝ SFS 4600
          abc←'DĐÐ' 'EÉÆŒ' 'LŁ' 'NŊ' 'OŒ' 'VW' 'SŠẞ' 'YÜŰ' 'ZŽ' 'ÖØÕŐ'VariantsOf'DELNOVSYZÖ'⊢' ',⎕A,'ÅÄÖ'~'W'
          Norm←'AOS'ExpLigs'ÆŒẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

      German←{ ⍝ DIN 5007 § 6.1.1.4.1
          abc←'aAäÄ' 'oOöÖ' 'ßẞsS' 'uUüÜ'VariantsOf'AOSU'⊢' ',⎕A
          Norm←'sS'ExpLigs'ßẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

    :Section Utils
    spaces←⊂'.''-/'

    Mix←↑⍣≡

    DnUp←0 1∘.(,819⌶)⊢

    Full←1 3 2⍉↑∘DnUp

    ExpLigs←{(,DnUp ⍵⍵)⎕R(,DnUp ⍺⍺,¨⍵⍵)⊢⍵}

      VariantsOf←{
          base←' ',⍵⍵
          add←spaces,⍺⍺
          Full(,¨base,'.')⎕S((base,¨add),'&')⊢' ',⍵
      }

      Sort←{
          ⍺←⊢
          ⍵⌷⍨⊂⍺ ⍺⍺↑⍣≡⍵⍵ ⍵
      }
    :EndSection

:EndNamespace
