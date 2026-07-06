-- AUTO-GENERATED: OP06-016 / 레이즈 맥스
-- rules_id=OP06-016 script_id=880000750 fingerprint=1fe3d8346f77fb107e1c00de7ba8d1c1b2cc06294347b42eb7ef87fe63c163c8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-016]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-3000,
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
            op=[[RETURN_SELF_TO_DECK_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 주인의 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-016]],
    schema_version=1,
  })
end
