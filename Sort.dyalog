:Namespace Sort
    ⎕ML←1

      Classic←{
          ⎕AV ⍺⍺ Sort Mix ⍵
      }

      Natural←{
          Digits←∊∘⎕D
          CutOffs←1,2≠/Digits
          Parts←CutOffs⊂⊢
          ExecNums←{
              ⊃⊃⎕VFI ⍵:⍎⍵
              ⍵
          }
          Norm←ExecNums¨∘Parts¨
          ⍺⍺ Sort Norm ⍵
      }

      Danish←{
          abc←'ÁÉÍÓÚÝǼǾ○'VariantsOf'AEIOUYÆØÅ'⊢' ',⎕A,'ÆØÅ'
          Norm←'aa' 'Aa' 'AA'⎕R(,¨'ӑӐӐ')
          abc ⍺⍺ Sort Norm ⍵
      }

      Finnish←{ ⍝ https://en.wikipedia.org/wiki/Finnish_orthography#Collation_order
          abc←'DĐÐ' 'EÉÆŒ' 'LŁ' 'NŊ' 'OŒ' 'VW' 'SŠẞ' 'YÜŰ' 'ZŽ' 'ÖØÕŐ'VariantsOf'DELNOVSYZÖ'⊢' ',⎕A,'ÅÄÖ'~'W'
          Norm←'AOS'ExpLigs'ÆŒẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

      German←{ ⍝ https://en.wikipedia.org/wiki/German_orthography#Sorting
          abc←'aAäÄ' 'oOöÖ' 'ßẞsS' 'uUüÜ'VariantsOf'AOSU'⊢' ',⎕A
          Norm←'sS'ExpLigs'ßẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

    :Section Utils

      Under←{ ⍝ a.k.a. Dual
          ⍺←⊢
          11::A⊣(∊A)←⍺ ⍺⍺∊A←⍵ ⍝ if function cannot be inverted, try acting on shape rather than data
          2=⎕NC'⍺':⍵⍵⍣¯1⊢(⍵⍵ ⍺)⍺⍺(⍵⍵ ⍵)
          ⍵⍵⍣¯1 ⍺⍺ ⍵⍵ ⍵
      }

      AtUE←{ ⍝ @ Under ∊
          ⍺←⊢
          ⍺ ⍺⍺@⍵⍵ Under∊⍵
      }

      ExpLigs←{ ⍝ Expand Ligatures
          from←,LoUp ⍵⍵
          to←,LoUp ⍺⍺,¨⍵⍵
          from ⎕R to⊢⍵
      }

      VariantsOf←{
          base←' ',⍵⍵
          add←spaces,⍺⍺
          from←,¨base,'.'
          to←'&',⍨base,¨add
          Full from ⎕S to⊢' ',⍵
      }

      Sort←{
          ⍺←⊢
          ⍵⌷⍨⊂⍺ ⍺⍺ Mix ⍵⍵ ⍵
      }

      Mix←{ ⍝ ↑⍣≡ padding with ⎕UCS 0
          ' 'AtUE(=∘last)zero AtUE IsSp Mix last AtUE IsSp ⍵
      }

    (zero last)←⎕UCS 0 1114111 ⍝ first and last Uniocde code points

    spaces←⊂'.''-/'

    IsSp←' '=⊢

    LoUp←0 1∘.(,819⌶)⊢ ⍝ Fold to lower and upper

    Full←1 3 2⍉↑∘LoUp ⍝ Convert nested uppercase to full ⍋-style alphabet

    :EndSection

:EndNamespace
