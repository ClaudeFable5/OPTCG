-- AUTO-GENERATED: OP06-035 / 호디 존스
-- rules_id=OP06-035 script_id=880000769 fingerprint=2746133cb70358c018c9a8d8e91b253e535255e5a6b62954d50c315c5f3cb9cd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-035]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            card_selector={
              count=2,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            count=2,
            mode=[[UP_TO]],
            op=[[REST_CARD_OR_DON]],
            player=[[OPPONENT]],
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[YOU]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 캐릭터 또는 두웅!!을 합계 2장까지 레스트로 한다. 그 후, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[RUSH]],
    },
    rules_id=[[OP06-035]],
    schema_version=1,
  })
end
