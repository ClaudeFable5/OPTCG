-- AUTO-GENERATED: OP11-046 / 빈스모크 욘디
-- rules_id=OP11-046 script_id=880001380 fingerprint=59edc26f94f9c16561ff0704a8d1c96fda387b89a19246b52f21ffa5ffebb320
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-046]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_KO]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            duration=[[WHILE_CONDITION]],
            op=[[CANNOT_BE_RESTED]],
            reason=[[OPPONENT_EFFECT]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            filter={
              trait_contains=[[제르마]],
            },
            op=[[ONLY_CHARACTERS_MATCH]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[자신의 캐릭터가 『제르마』를 포함한 특징을 가진 캐릭터뿐이라면, 이 캐릭터는 상대의 효과로, KO 당하지 않으며 레스트 되지 않는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-046]],
    schema_version=1,
  })
end
