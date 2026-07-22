-- AUTO-GENERATED: OP14-013 / 몽키 D. 루피
-- rules_id=OP14-013 script_id=880002178 fingerprint=260e76d3bad3d5d99df3881714fb7ff028b5ce1f81c08c6def4215d00a9e303c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-013]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[HAND]],
            filter={
              name_neq=[[몽키 D. 루피]],
              trait=[[초신성]],
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 5장을 보고, 「몽키 D. 루피」 이외의 《초신성》 특징을 가진 카드 1장까지를 공개하고 패에 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
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
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【어택 시】이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -1000.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-013]],
    schema_version=1,
  })
end
