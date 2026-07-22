-- AUTO-GENERATED: OP14-084 / 미스 올 선데이
-- rules_id=OP14-084 script_id=880002249 fingerprint=9bc4da78d871dad4e79dc20ce25fc36573245422d35fa1fcd9ffbbadb0deb3de
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-084]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait_contains=[[바로크 워크스]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=1,
              trait_contains=[[바로크 워크스]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
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
        source_text=[[【등장 시】자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 자신의 트래시에서 『바로크 워크스』를 포함한 특징을 가진 코스트 4 이하와 1인 캐릭터 카드를 각각 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-084]],
    schema_version=1,
  })
end
