-- AUTO-GENERATED: ST04-001 / 카이도
-- rules_id=ST04-001 script_id=880001765 fingerprint=43bc574a60e565d94fa50d4d518d4d9c4dc2f6e7eb6fc7363ce79dd7ca82099f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST04-001]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=7,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!!-7(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 상대의 라이프를 위에서 1장까지 트래시로 보낸다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[ST04-001]],
    schema_version=1,
  })
end
