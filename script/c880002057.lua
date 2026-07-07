-- AUTO-GENERATED: P-068 / 상디
-- rules_id=P-068 script_id=880002057 fingerprint=b76e995e6088ccdacf2f71fe70e55d1a69699f23b32abc52e47dc0d01b317983
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-068]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=5,
            destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
            op=[[LOOK_REORDER_DECK_TOP]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 덱 위에서 5장을 보고, 원하는 순서대로 덱 맨 위나 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-068]],
    schema_version=1,
  })
end
