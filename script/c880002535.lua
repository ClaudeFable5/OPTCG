-- AUTO-GENERATED PROMO: P-155 / 트라팔가 로
-- rules_id=P-155 script_id=880002535
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-155]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-2000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              has_trigger=true,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 패에서 【트리거】를 가진 카드 1장을 버릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -2000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-155]],
    schema_version=1,
  })
end
