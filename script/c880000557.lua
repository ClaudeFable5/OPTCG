-- AUTO-GENERATED: OP04-065 / 미스 골든위크(마리안느)
-- rules_id=OP04-065 script_id=880000557 fingerprint=b98ae980ef8483b9a62f55096ab770935ba55c0d2fcf4ea1506c80ddbe4f57d7
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-065]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[CANNOT_ATTACK]],
            selector={
              count=1,
              filter={
                cost_lte=5,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 상대의 코스트 5 이하인 캐릭터 1장까지는 다음 자신의 턴 개시 시까지 어택할 수 없다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-065]],
    schema_version=1,
  })
end
