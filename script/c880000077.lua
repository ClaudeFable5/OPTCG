-- AUTO-GENERATED: EB02-016 / 쵸파맨
-- rules_id=EB02-016 script_id=880000077 fingerprint=8c313eeb95c8857175e2c4d98132b9cc63ef1990e6c41b5367bf73d2ba4df5d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[RULE]],
            name=[[토니토니 쵸파]],
            op=[[ADD_NAME_ALIAS]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 이 카드의 카드명은 「토니토니 쵸파」로도 취급한다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[동물]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 코스트 3 이하인 《동물》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-016]],
    schema_version=1,
  })
end
