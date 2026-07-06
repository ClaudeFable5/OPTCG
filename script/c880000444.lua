-- AUTO-GENERATED: OP03-078 / 잇쇼
-- rules_id=OP03-078 script_id=880000444 fingerprint=ff7c78b8fe104ca988a2092a4c2395acfffdb216e1279cd4c17f0d97610307a5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【자신의 턴 동안】상대의 모든 캐릭터의 코스트 -3.]],
        timings={
          [[CONTINUOUS_YOUR_TURN]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=6,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 패가 6장 이상인 경우, 상대의 패 2장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-078]],
    schema_version=1,
  })
end
