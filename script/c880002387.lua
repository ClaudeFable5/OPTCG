-- AUTO-GENERATED: OP15-085 / 토니토니 쵸파
-- rules_id=OP15-085 script_id=880002387 fingerprint=0e2817fc3953e64b91a5e4744c5f61e243ee722685287cb030d1f5c817cf44cf
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-085]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 3장을 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name_neq=[[토니토니 쵸파]],
              trait=[[밀짚모자 일당]],
            },
            mode=[[UP_TO]],
            op=[[ADD_FROM_TRASH]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 자신의 트래시에서 「토니토니 쵸파」 이외의 《밀짚모자 일당》 특징을 가진 캐릭터 카드 1장까지를 패에 넣는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-085]],
    schema_version=1,
  })
end
