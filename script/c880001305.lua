-- AUTO-GENERATED: OP10-090 / 프랑키
-- rules_id=OP10-090 script_id=880001305 fingerprint=e44ce608d93e62d6f57f4b838500c1addbe264875475e2f93d6dcf4080c8ba95
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-090]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=3,
              trait=[[드레스로자]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 코스트 3 이하인 《드레스로자》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP10-090]],
    schema_version=1,
  })
end
