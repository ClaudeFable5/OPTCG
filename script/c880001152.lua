-- AUTO-GENERATED: OP09-056 / Mr.3(갤디노)
-- rules_id=OP09-056 script_id=880001152 fingerprint=e77d216d8e485a2ca09bce5a0035cdd4d4d01e331f69ac851797eee0220d33d8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-056]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              any={
                {
                  trait=[[크로스 길드]],
                },
                {
                  trait_contains=[[바로크 워크스]],
                },
              },
              name_neq=[[Mr.3(갤디노)]],
            },
            look_count=4,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 4장을 보고, 「Mr.3(갤디노)」 이외의 《크로스 길드》 특징 또는 『바로크 워크스』를 포함한 특징을 가진 카드를 1장까지 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-056]],
    schema_version=1,
  })
end
