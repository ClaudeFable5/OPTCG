-- AUTO-GENERATED: OP09-101 / 쿠잔
-- rules_id=OP09-101 script_id=880001197 fingerprint=22a473c9104e5b18317c66ceae87e3280b0c8e37f0956dc503f72c71bd1e8b6e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-101]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            faceup=true,
            op=[[ADD_OPPONENT_CARD_TO_LIFE]],
            positions={
              [[LIFE_TOP]],
              [[LIFE_BOTTOM]],
            },
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[OPPONENT]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 코스트 3 이하인 캐릭터 1장을 상대의 라이프 맨 위나 아래에 앞면으로 놓는다: 상대는 자신의 패 1장을 버린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-101]],
    schema_version=1,
  })
end
