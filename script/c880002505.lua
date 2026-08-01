-- AUTO-GENERATED PROMO: P-083 / 샹크스
-- rules_id=P-083 script_id=880002505
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-083]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
            },
            op=[[TRASH_HAND]],
          },
        },
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패에서 캐릭터 카드 1장을 버릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000. 그 후, 카드를 1장 뽑는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[P-083]],
    schema_version=1,
  })
end
