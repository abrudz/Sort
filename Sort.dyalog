:Namespace Sort
    ⎕ML←1

      Classic←{
          ⎕AV ⍺⍺ Sort Mix ⍵
      }

      Natural←{
          ABC←abc←⊢
          Digits←∊∘⎕D
          CutOffs←1,2≠/Digits
          Parts←CutOffs⊂⊢
          ExecNums←{
              ⊃⊃⎕VFI ⍵:⍎⍵
              ⍵
          }
          NORM←Norm←ExecNums¨∘Parts¨
          abc ⍺⍺ Sort Norm ⍵
      }

      Danish←{ ⍝ http://sproget.dk/raad-og-regler/Retskrivningsregler/retskrivningsregler/a7-1-6/a7-4-alfabetisk-rekkefolge
          ABC←abc←⊖'ÁÀ' 'Ç' 'Ð' 'ÉÈË' 'Þ' 'ÍÌÏ' 'ÓÒ' 'Ú' 'ÝÜ' 'ÄǼ' 'ÖǾ' 'Ᾰ'VariantsOf'ACDEHIOUYÆØÅ'⊢' ',⎕A,'ÆØÅ'
          NORM←Norm←'aa' 'Aa' 'AA' 'þ' 'Þ'⎕R'ӑ' 'Ӑ' 'Ӑ' 'tþ' 'TÞ' ⍝ n.b. not ligatures
          abc ⍺⍺ Sort Norm ⍵
      }

      Finnish←{ ⍝ https://en.wikipedia.org/wiki/Finnish_orthography#Collation_order
          ABC←abc←'DĐÐ' 'EÉÆŒ' 'LŁ' 'NŊ' 'OŒ' 'VW' 'SŠẞ' 'YÜŰ' 'ZŽ' 'ÖØÕŐ'VariantsOf'DELNOVSYZÖ'⊢' ',⎕A,'ÅÄÖ'~'W'
          NORM←Norm←'AOS'ExpLigs'ÆŒẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

      German←{ ⍝ https://en.wikipedia.org/wiki/German_orthography#Sorting
          ABC←abc←'aAäÄ' 'oOöÖ' 'ßẞsS' 'uUüÜ'VariantsOf'AOSU'⊢' ',⎕A
          NORM←Norm←'sS'ExpLigs'ßẞ'
          abc ⍺⍺ Sort Norm ⍵
      }

    :Section Utils

      Under←{ ⍝ a.k.a. Dual
          ⍺←⊢
          11::A⊣(∊A)←⍺ ⍺⍺∊A←⍵ ⍝ if function cannot be inverted, try acting on shape rather than data
          2=⎕NC'⍺':⍵⍵⍣¯1⊢(⍵⍵ ⍺)⍺⍺(⍵⍵ ⍵)
          ⍺ ⍵⍵⍣¯1 ⍺⍺ ⍵⍵ ⍵
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
          ' 'AtUE(=∘last)zero AtUE IsSp↑⍣≡last AtUE IsSp ⍵
      }

    (zero last)←⎕UCS 0 1114111 ⍝ first and last Uniocde code points

    spaces←⊂'.''-/'

    IsSp←' '=⊢

    LoUp←0 1∘.(,819⌶)⊢ ⍝ Fold to lower and upper

    Full←1 3 2⍉↑∘LoUp ⍝ Convert nested uppercase to full ⍋-style alphabet

    :EndSection

:EndNamespace
