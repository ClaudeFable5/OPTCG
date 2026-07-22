-- AUTO-GENERATED: OP14-070 / 버팔로
-- rules_id=OP14-070 script_id=880002235 fingerprint=ff21083be289f5a0d659249458796dbb5ba762061d58066717d3e9fb11cbb317
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-070]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터가 상대의 캐릭터의 효과로 레스트가 되었을 때, 자신 필드의 두웅!! 1장을 두웅!! 덱으로 되돌려도 된다. 이 경우, 이 캐릭터를 액티브로 한다.]],
        timings={
          [[ON_SELF_RESTED_BY_OPPONENT_EFFECT]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP14-070]],
    schema_version=1,
  })
end
