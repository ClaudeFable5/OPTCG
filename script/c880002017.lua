-- AUTO-GENERATED: P-013 / 고든
-- rules_id=P-013 script_id=880002017 fingerprint=f26ada7c60853ec03226e4cb26131f75f095d99c26d86b5c0ac801d56c7a1f72
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-013]],
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
        source_text=[[【기동: 메인】이 캐릭터를 주인의 덱 맨 아래로 되돌릴 수 있다: 이번 턴 동안, 상대 캐릭터 1장까지의 파워 -3000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[P-013]],
    schema_version=1,
  })
end
