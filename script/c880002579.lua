-- MANUAL: OP16-022 / 몽키 D. 루피 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-022]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[ALL_OWN_CHARACTERS_HAVE_TRAIT]],
            player=[[YOU]],
            trait=[[임펠 다운]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동 메인】【턴 1회】 자신의 캐릭터가 특징 《임펠 다운》을 가진 캐릭터뿐일 경우, 자신의 두웅!! 2장까지를 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-022]],
    schema_version=1,
  })
end
