-- AUTO-GENERATED: OP07-033 / 몽키 D. 루피
-- rules_id=OP07-033 script_id=880000887 fingerprint=6d3831ac9d17f45512cd880112e260203932654ff7f1dbc232f1b7b1ee3de81c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=0,
              filter={
                cost_lte=3,
                name_neq=[[몽키 D. 루피]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=3,
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 3장 이상인 경우, 자신의 「몽키 D. 루피」 이외의 코스트 3 이하인 캐릭터는 상대의 효과로는 KO 당하지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-033]],
    schema_version=1,
  })
end
