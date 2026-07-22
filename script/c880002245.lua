-- AUTO-GENERATED: OP14-080 / 겟코 모리아
-- rules_id=OP14-080 script_id=880002245 fingerprint=cc32ef79aa0a805efa231e5ce411105644a07df3faef6d7f6fff85ae3cf4dcce
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-080]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=0,
              kind=[[LEADER_OR_CHARACTER]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              trait=[[스릴러 바크 해적단]],
            },
            op=[[KO_OWN_CARD]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 《스릴러 바크 해적단》 특징을 가진 캐릭터 1장을 KO 시킬 수 있다: 이번 턴 동안, 자신의 리더와 모든 캐릭터의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=3,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패 3장을 버릴 수 있다: 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-080]],
    schema_version=1,
  })
end
