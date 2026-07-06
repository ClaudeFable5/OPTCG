-- AUTO-GENERATED: OP04-050 / 행거
-- rules_id=OP04-050 script_id=880000542 fingerprint=019202f6b0a5e58d1014bdf5618a640f09605c1a2b8ff9a706527d87f1c29cbe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
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
            op=[[TRASH_HAND]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고 이 캐릭터를 레스트할 수 있다: 카드를 1장 뽑는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-050]],
    schema_version=1,
  })
end
